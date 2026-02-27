# XProc Exercise 
*(This assignment involves a review of several technologies you've been learning so far, to assemble your own XProc pipeline. It is therefore worth 10 points: triple homework)* 

With this exercise, you will learn how to assemble the parts of an XProc pipeline, and run it to collect outputs in the form of messages and files. Work with our [XProc Pipelining Tutorial](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/xproc/XProc-Pipelining-Tutorial.md) and our [sample XProc files from the Onepiece project](https://github.com/newtfire/textAnalysis-Hub/tree/main/Class-Examples/xproc/onepiece-project) to help you complete this assignment.

Complete this in stages. **Assemble all the files you need in a special directory on your personal GitHub repo**, so you can point us to your repo when you're finished. Set the output(s) of your pipeline to store in that directory, too.

## Choose your source file(s)

* You may work with the Pokemon Moves Generation 5 text file from [Invisible XML Exercise 1](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/invisible_xml/ixml-ex1.md) and move it through your working Invisible XML grammar. 
* You may work with the Zoom Transcript Invisible XML from [Invisible XML Exercise 2](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/invisible_xml/ixml-ex2.md). If your Invisible XML does not work, you can work with [Dr. B's or Molly Wright's working versions](https://github.com/newtfire/textAnalysis-Hub/tree/main/Class-Examples/invisible_xml/zoom-transcripts).
* Or, you may choos a file related to your project or that interests you for which you write an invisible XML grammar that works to output some XML.

Take some time with the Invisible XML to make sure it is working and outputting XML that you can use in a pipeline.

## Prepare the parts of a pipeline with at least 3 steps
You'll be constructing a pipeline process in XProc that does the following:

* Takes a plain text source file as input and sends it to Invisible XML.
* Transforms the XML output from Invisible XML in some way: 
    * You could use the native XProc transformations to "wrap" or "unwrap" elements, or add attributes or delete nodes. 
    * You could write an XSLT identity transformation and apply `<xsl:analyze-string>` to match string patterns and add more markup.
   
* Sends that output to at least one more pipeline processing step. You could:
     * Write XSLT to SVG from the output of the previous step to visualize some data that you're able to quantity in any way that you like.
     * Or, write XSLT to HTML to extract some information in a list or chart, or create a reading view. 
     * If working with Zoom transcript data, you could try isolating the spoken transcript portions and get a word count or `string-length()` value for each, and find out where the time segment with the most spoken words is located. To get a word count with XSLT, you can tokenize the text nodes with the `tokenize()` XPath function, and split the text apart on space characters like this:
     ```
     //transcript/text() ! tokenize(., '\s+') 
     ```
     In the oXygen XPath window that would tokenize all the words in each transcript element.
     In XSLT you could make a global variable near the top of the document that stores the total count of *all* the words in all the transcript nodes.
     Then you can get a count of tokens in each time segment  in a template rule with: 
     
     ```xml
     <xsl:for-each select="transcript">
           <xsl:variable name="wordTokens" select="tex() ! tokenize(., '\s+)"/>
           <xsl:variable name="countTokens" select="count($wordTokens)"/>
           
           <xsl:value-of select="$countTokens div $totalTokens"/>
         
       </xsl:for-each>
      ```  
      
      
How would you want to output that information? Inspect it and maybe limit the output to the to 10 longest or shortest segments: these would show whether the people are talking a lot faster in certain points and a lot slower than others. 

You can plot that sort of thing with SVG and we want you to be able to do this for your projects. So try an XSLT-to-SVG transformation in your XProc pipeline.
      
## Script a pipeline in XProc     
Follow our examples and guidance in the [XProc Pipelining Tutorial](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/xproc/XProc-Pipelining-Tutorial.md) and construct your pipeline. Run it with Calabash or Morgana to test this in stages as you go to help you debug if things go wrong.

____
## What to submit
When your pipeline is running it is probably going to be sending files into the directory you created in your personal repo for this assignment. 
Push your work to your personal GitHub repo and send us a direct link to that directory on your repo at the assignment submission point.


     
           