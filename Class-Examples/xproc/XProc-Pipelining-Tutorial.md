# XProc Pipelining Tutorial
*by Elisa Beshero-Bondar for the Penn State Behrend Digit Program*

<h2>The Big Picture: Pipelines for Projects </h2>
<p>Pipelines in processing text / media are all about scripting changes in stages that you define. XProc gives us a method to do this with "XML stack" technologies for transforming text and checking outputs. </p>

<p> XProc pipeline files are saved with the extension <strong><code>.xpl</code></strong>.</p>

<p>We usually apply XProc to script a pipeline of processes that take an input file (or collection of input files), runs it through a series of processes and produces one or more outputs at each stage. Here's an example of a fairly detailed pipeline of processes to support  that we can script with XProc and run with Calabash or Morgana.
</p>

<section class="flex" style="display:flex;justify-content:space-around">
<figure class="samplePipeline" style="flex:1">
<img src="xprocSamplePipeline-mermaid.png" alt="diagram of an XProc pipeline process" style="max-width:300px;width:90%:" />
<figcaption style="font-style:italic">Diagram of a sample XProc pipeline process that starts wtih plain text, applies invisible XML, XSLT, and Relax NG validation, and produces multiple outputs in .xml and .svg</figcaption>
</figure>


<div class="samplePipeline" style="flex:1">

<ul>
    <li><strong>Start</strong> by identifying a source text file (or collection of texts) to take as the beginning input.
 </li>
 <li><strong>Pipe</strong> that source into parsing with an invisible XML grammar file.</li>
<li><strong>Store</strong> the output of the grammar (in memory or saved on your computer as an output stage).
</li>
<li><strong>Pipe</strong> that output to XSLT to make changes, add more markup by processing regular expressions with <code>&lt;xsl:analyze-string&gt;</code> .</li>
<li><strong>Store</strong> the output of XSLT (in memory or saved on your computer as an output stage).</li>
<li> <strong>Pipe</strong> that output to <strong>test</strong> it with a Relax NG schema validation step and let you know if it's valid to your project schema.
   <ul>
        <li><strong>If the XML is NOT valid to the schema: stop and output an error message</strong> identifying what's wrong with the XML.
        </li>
   	<li><strong>If the XML is valid to the schema</strong>:
   	    <ul>
   	       <li><strong>Pipe</strong> it to a second XSLT file to output an SVG visualization.</li>
   	       <li><strong>Store</strong> the SVG directly (perhaps to a web-publishing directory to publish on a website).
   	   </ul>
   	</li>
   </ul>
</li>
</ul>
<p>A pipeline like this requires a lot of preparation! Each of those stages requires some work to prepare individually, and assembling them into a pipeline makes it easy to update your source files, make changes at some stage of the process, and quickly run Calabash or Morgana to see the results. </p>
</section>

<h3>Outputs of XProc are usually...</h3>
<ul>
<li>...messages that you deliver to let you know if there's an error or that a stage in the pipeline finished processing,</li>
<li>...storage of files in progress (if you wish), and/or</li>
<li>...storage of output files to directories as end-points.</li>
</ul>

<p>Pipelines can branch and sprout, depending on what you want to script, or they can  just be a straight line!</p>
</div>



## Learning how to script a pipeline

We'll eventually ask you to construct a pipeline as part of your project, so it will help to study how a pipeline is written, and then try to make a simple pipeline of your own based on our work in the Digit 210 class so far. It will help to study some complete pipelines for projects.

The example code we provide below comes from the [Onepiece project](https://github.com/sam-seb/op-sbs) from Spring 2025. You can study the pipeline files and their stored outputs on our class GitHub at <https://github.com/newtfire/textAnalysis-Hub/tree/main/Class-Examples/xproc/onepiece-project>.  The Onepiece project prepared two XProc files:

1. The [first XProc](https://github.com/newtfire/textAnalysis-Hub/tree/main/Class-Examples/xproc/onepiece-project/onepiece-pipeline.xml) took **a single text file** input and output single files.
2. The [second XProc](https://github.com/newtfire/textAnalysis-Hub/tree/main/Class-Examples/xproc/onepiece-project/onepieceColl-pipeline.xpl) **processes a collection** of text files in a directory and outputs a new directory of similarly named output files.

### Running a pipeline (.xpl) file
**Run your pipeline frequently, as you write each new stage!**  Read the output in your shell carefully watching for error messages and try to debug as you go. You can explore and test by running your pipelines on your system with Calabash or Morgana. (If you want to make changes to these files, please check out your own branch or copy and move the files outside our class GitHub repo.) To run a pipeline with Calabash: 

```shell
calabash yourPipeline.xpl 
```

## Writing XProc
Here we provide example code blocks to show distinct parts of XProc files. 

### The whole document: `<p:declare-step>`
The root element of an XProc file is always `<p:declare-step>`. **We recommend that you start with one of our sample starter files** and adjust the root element. When you open a new XProc file in the oXygen XML Editor, it won't include all the details that help with running Calabash in the root element we are providing. 

You can provide a `@name` attribute to name your XProc file and just give it a meaningful name. 

```xml
<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">
    
    	<!--  the rest of the pipeline is developed here. -->
    
</p:declare-step>
```

### Taking input from external files and directories
When you start a pipeline to run with files, you need to point XProc to the file or files you want to process.
This works differently for taking a single external file as input vs. a directory of files. 

#### Single file input
Here is how to set up the beginning of an XProc pipeline to accept a single text file for input, if that file is named `vol-4.txt`  is stored in a subdirectory named "source": `source/vol-4.txt`
You set the relative filepath to that file from the XProc document;

```xml
<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">
    
   <p:input port="source" primary="true" content-types="text/plain" href="source/vol-4.txt"/>
    
</p:declare-step>
```
You could also point that `@href` attribute to a web URL, which just relies on an internet connection to retrieve the file you want to process. 

#### Multiple files (directory) input
Reaching for a file dircectory is a litlte unusual in XProc and won't look like how we've done similar things in XSLT. 
Here's how it works.

Begin by declaring the collection you want to process in `<p:directory-list>`

```xml
<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">

	<p:directory-list name="sourceColl" path="source" include-filter="vol-[0-9].txt" detailed="true"/>   
 
    
</p:declare-step>
```
Then, introduce XProc's for-each to wrap around all the processing. **For each** file in the directory, run the steps you'll be scriptting.
Within the `<p:for-each>` you have to reach for a specific file now stored in XProc's internal directory tree. You reach into that tree in a way that
will make you think of reaching into a hard drive, but it's really not: it's XProc's internal parsing of the imported directory tree marked as `//c:file`

Notice:

* `//c:file` will stand for each specific text file in this collection. 
* `//c:file/@name` is actually the filename! (Yes, we know that looks like an attribute, but it's a special notation distinct to XProc. 
* We stored a portion of the `//c:file/@name` before its `.txt` file extension using an XPath function, `substring-before()`. We'll use that filename later when we store our output. 
* The `<p:load>` element ensures we are importing every single text file in a collection for processing in the pipeline. 


```xml
<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">

	 <p:directory-list name="sourceColl" path="source" include-filter="vol-[0-9].txt" detailed="true"/>   
 	<p:for-each>
 		 <p:with-input select="//c:file"/>
      		  <!-- ebb: Don't worry. The above line is NOT a literal filepath. It's just XProc-speak for each individual file in the directory. -->
       		
       		 <p:variable name="filename" as="xs:string" select="//c:file/@name ! substring-before(., '.txt')"/>
       		  <p:load href="source/{//c:file/@name}"/>
 
                    <!--  Processing Steps to be added -->
 
	 </p:for-each>
</p:declare-step>
```

### Steps for a Project Pipeline
Each of these distinct kinds of XProc processing steps has its own distinct syntax. You should be able to copy and paste from our example code blocks into your XProc script in the appropriate places and adapt them to your own processing needs. 

Note that after each stage of processing, you can output messages to your shell to let you know that things completed or if there were erros. Especially at first, you may want to see lots of these messages to be sure your pipeline is running as you planned!. 

You may also want to store outputs of each stage of your pipelines to see if and how they are working.

#### Processing an Invisible XML Grammar
XProc was around before Invisible XML was introduced, so the ability to process an ixml step is still new enough that our oXygen XML Editor doesn't know about it.
Don't worry about the red error that oXygen generates when you apply the `<p:invisible-xml>` step. We highly recommend setting up `"markup-blitz"` as the value for `@processor`because blitz will run blazingly fast and you can use it as you assemble lots of project input.

* Notice how you set a new input port here for your ixml grammar file, and how you point to it with a relative filepath from the XProc file. 
* After the `<p:invisible-xml>` element closes, **you should store your output** so you can check it for problems.
* We've added an optional message to show you whether the invisible XML processed.

```xml
<p:invisible-xml cx:processor="markup-blitz">
        <!--ebb: As of now (version 28) oXygen will flag <p:invisible-xml> as an error. 
            Don't worry. It's not!  -->
        <p:with-input port="grammar">
            <p:document href="ebb-ZoomTranscript.ixml" content-type="text/plain"/>
        </p:with-input>
    </p:invisible-xml>
    <!--  You have to store your output! We've added an optional message to show you whether the invisible XML processed. -->
     <p:store name="simple-XML" href="onepieceSimple.xml"/>
    <p:identity message="Stored some simple XML made by invisible XML grammar."/>
```
#### Native XProc Processing Options
Martin Kraetike's [XProc 3.0 Tutorial](https://xporc.net/xproc-tutorial/) provides helpful examples of XProc's transformation steps. This section of the tutorial, [**Steps for Basic XML Manipulations**](https://xporc.net/xproc-tutorial/steps-for-basic-xml-manipulations/), seems especially useful for our projects. It shows you examples of basic changes you can make to a document by selecting its element and attribute nodes with XProc. You can "wrap" and "unwrap" elements in an XML file, you can add and delete attributes, and more. 

*  `<p:insert/>`
* `<p:delete/>`
* `<p:rename/>`
* `<p:replace/>`
* `<p:wrap/>`
* `<p:unwrap/>`
* `<p:add-attribute/>`
 
#### XSLT
Unlike the Invisible XML grammar step, we find we don't have to specify an input source for XSLT processing, so we don't actually have to set the `<p:with-input port="...">` this time. We decided to keep the syntax for that and comment it out because you may seriously want to specify that input if it comes from a step before the latest one. Without it, you make an implicit pull on the results of the previous step. 

```xml
  <p:xslt>
    <!-- We found we did not need to specify the <p:with-input> line below, because 
    if we do not specify an input we make an "implicit connection" to process the result of the
    previous step. We're just commenting it out in case you ever want to use it. You might want 
    someday want to specify a *different* input port than the immediately preceding one. -->
    <!--    <p:with-input port="source">
            <p:pipe step="simple-XML" port="result"/>
        </p:with-input>-->
        <p:with-input port="stylesheet" href="id-transform-regex.xsl"/>
    </p:xslt>

```


#### XQuery
[To be developed.]



____
## Schema Validation Steps
When preparing XML for a project, you should define a schema with Relax NG and/or Schematron to make sure it is **valid** according to your project rules. Since your pipeline is likely generating XML files, you can prepare a schema for them to define valid outputs. Instead of opening up the file in oXygen, associating the schema by hand, and reviewing for red boxes and error lines, XProc lets you add schema validation steps to find out and report validation errors or whether validation is succesful. 

#### Validating with Relax-NG
If your project is part of the TEI, you should have an ODD customization which you processed in oXygen to output as Relax NG and associated with your XML, so you can point the XProc Relax NG valiation step to your `odd.rng` location.  Otherwise you should make a Relax NG Compact Syntax schema (*.rnc). If you are new to writing Relax NG or want to review it, check out our [RelaxNG tutorial](https://newtfire.org/courses/tutorials/explainRNG.html).

Here is some sample XProc for a Relax NG validation step. Notice that we output a message to tell us when things go well. 
The XProc processor should tell us automatically when there is a validation error. 

```xml
<p:validate-with-relax-ng>
        <p:with-input port="schema">
            <p:document href="mySchema.rnc" content-type="application/relax-ng-compact-syntax"/>
        </p:with-input>
    </p:validate-with-relax-ng>
    <p:identity message="Validated with Relax NG"/>
```

#### Validating with Schematron
Schematron validation may also be part of your project wor kflow. This kind of schema tends to complement Relax NG by checking for relationships between nodes, and rules are defined by XPath relationships. To learn about or remind yourself how Schematron works, here is our [Schematron tutorial](https://newtfire.org/courses/tutorials/explainSchematron.html).

Here is some sample XProc for a Schematron validation step. Again, notice that we set up an output message to let us know that this schema validated the XML. If it did not, it should output the  error messages you wrote in your Schematron. 

```xml
<p:validate-with-schematron name="finalize-xml">
        <p:with-input port="schema">
            <p:document href="mySchematron.sch" content-type="application/schematron+xml"/>
        </p:with-input>
    </p:validate-with-schematron>
    <p:identity message="Validated with Schematron"/>
```
____

### Outputting a message in the shell when a stage is completed

We recommend setting up lots of little messages to yourself to show you when steps are running, as the display of these messages in the shell when you run your pipeline will help you to figure out where you need to debug if the pipeline stops on an error.

```xml
 <p:identity message="Added markup with ixml"/>
```

### Outputting a file / collection of files

Note how the `<p:store>` step works when steps like Invisible XML and XSLT are finished. 

#### Single ouput file
Save the result of an Invisible XML grammar parse:

```xml
<p:store name="simple-XML" href="onepieceSimple.xml"/>
```

Save the result of an XSLT identity transformation:

```xml
 <p:store href="onepieceFull.xml" serialization="map {
        'method' : 'xml',
        'indent' : true(),
        'omit-xml-declaration' : false()
        }"/>
```

#### Multiple output files

If you are processing a directory of input files, you set up your XProc document like this to accept a `<p:directory-list>`:

```xml
<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">

	 <p:directory-list name="sourceColl" path="source" include-filter="vol-[0-9].txt" detailed="true"/>   
 	<p:for-each>
 		 <p:with-input select="//c:file"/>
      		  <!-- ebb: Don't worry. The above line is NOT a literal filepath. It's just XProc-speak for each individual file in the directory. -->
       		
       		 <p:variable name="filename" as="xs:string" select="//c:file/@name ! substring-before(., '.txt')"/>
       		  <p:load href="source/{//c:file/@name}"/>
 
                    <!--  Processing Steps to be added -->
 
	 </p:for-each>
</p:declare-step>
```

So, at the end of a process, how will you name and output a file for each of the input files? It helps that you created a `<p:variable>` to store the individual filename of your source file, dropping its original file extension. When you output a file, you apply that variable to construct the new filename.

Here is an example that is saving the output of an Invisible XML parse in an output directory named `ixml-output`:


```xml
<p:store name="simple-XML" href="ixml-output/{$filename}.xml"/>
```

Here is an example of an output from XSLT within an XProc that processes each file in a directory of source files. We surrounded this with the `<p:identity>` messages. 

```xml
<p:identity message="Running the Identity Trnasformation XSLT to develop the XML"/>
        <p:store href="full-output/{$filename}.xml" serialization="map {
            'method' : 'xml',
            'indent' : true(),
            'omit-xml-declaration' : false()
            }"/>
        <p:identity message="Saved finalized XML"/>
```



## Further Readings
This tutorial definitely does not show everything  you can do with XProc! To learn more and look up a wider variety of steps, check out these resources for learning XProc:

* [XProc 3.0 home page](https://xproc.org/): links to XProc specifications and tutorials
* Martin Kraetke's [XProc 3.0 Tutorial](https://xporc.net/xproc-tutorial/)
* David Birnbaum's "XProc Basics" tutorial. <https://dh.obdurodon.org/xproc-basics.xhtml>
* Erik Siegel's resources:
    * [XProc steps (3.1)](https://xprocref.org/index.html): super detailed with helpful examples!
    * XProc 3.0 Programmer Reference (print book). <https://xmlpress.net/publications/xproc-3-0/>







