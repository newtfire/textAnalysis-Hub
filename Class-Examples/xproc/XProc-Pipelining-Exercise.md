# XProc Pipelining Exercise

## Big picture: Pipelines for projects
Pipelines in processing text / media are all about scripting changes in stages that you define. XProc gives us a method to do this with "XML stack" technologies for transforming text and checking outputs.

We usually apply XProc to script a pipeline of processes that take an input file (or collection of input files), runs it through a series of processes and produces one or more outputs at each stage. Here's an example of a fairly detailed pipeline of processes to support  that we can script with XProc and run with Calabash or Morgana.

 XProc files are saved with the extension **`.xpl`.**

* **Start** by identifying a source text file (or collection of texts) to take as the beginning input.
*  **Pipe** that source into parsing with an invisible XML grammar file.
*  **Store** the output of the grammar (in memory or saved on your computer as an output stage).
*  **Pipe** that output to XSLT to make changes, add more markup by processing regular expressions with `<xsl:analyze-string>` .
*  **Store** the output of XSLT (in memory or saved on your computer as an output stage).
*  **Pipe**that output **test** it with a Relax NG schema validation step and let you know if it's valid to your project schema.
     *  **If the XML is valid to the schema**: 
          *  **Pipe** it to a second XSLT file to output an SVG visualization 
          *  **Store** the SVG directly to a web-publishing directory to publish on a website.
**
     * **Otherwise, stop and output an error message** identifying what's wrong with the XML.

That's an ambitious pipeline that comes after a lot of preparation! Each of those stages requires some work to prepare individually, and assembling them into a pipeline makes it easy to update your source files, make changes at some stage of the process, and quickly run Calabash or Morgana to see the results. 

### Outputs of XProc are usually:

* Messages that you deliver to let you know some stage in the pipeline finished processing 
* Storage of files in progress (if you wish) 
* Storage of output files at the end of the pipeline. 

Pipelines can branch and sprout, depending on what you want to script, or just be a straight line!

### Learning how to script a pipeline

We've been learning how to write pipelines by looking at examples and tinkering with the XProc syntax to apply them to our own scripts. So that is what we're going to do with this exercise. We'll eventually ask you to construct a pipeline as part of your project, so it will help to study how it is written, and then try to make a simple pipeline of your own based on our work in the Digit 210 class so far. 

Our example completed pipeline is from the [Onepiece project](https://github.com/sam-seb/op-sbs) from Spring 2025. You can study the pipeline files and their stored outputs on our class GitHub at <https://github.com/newtfire/textAnalysis-Hub/tree/main/Class-Examples/xproc/onepiece-project>. 

#### Running a pipeline (.xpl) file
You can explore and test by running these pipelines on your system with Calabash or Morgana. (If you want to make changes to these files, please check out your own branch or copy and move the files outside our class GitHub repo.) To run a pipeline with Calabash: 

```shell
calabash yourPipeline.xpl 
```

## Writing pipeline stages

### The whole document 
(root element)

### Taking input 

#### Single file

#### Multiple files 

for-each

### Storing in memory

### Outputting a message in the shell when a stage is completed

### Outputting a file / collection of files

#### Single ouput file

#### Multiple output files

Important to figure out your output filenames: make a variable! 














