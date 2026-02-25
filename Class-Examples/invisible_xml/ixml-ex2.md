# Invisible XML (ixml) Exercise 2

You are ready for this assignment if you have completed (that is, attempted and discussed and followed along) [Invisibe XML Exercise 1](ixml-ex1.md). This time we're not going to give as many pointers in the assignment, but let you figure out how to write your grammar working with what you learned form  our  guide,  ["Writing your First Invisible XML"](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/invisible_xml/iXMLstart.md)** and the readings/linked resources provided on invisible XML. 

## Source file: Zoom transcript
This time, let's try writing a grammar to structure the transcript and timestamps in this Zoom transcript made from a recording for our Digit 210 on January 30, 2026. 

<https://raw.githubusercontent.com/newtfire/textAnalysis-Hub/refs/heads/main/Class-Examples/invisible_xml/zoom-transcript.txt> 

You can follow the link to download and save this directly, or use `git pull` on the main branch of  the textAnalysis-Hub/Class-Examples/invisible_xml/zoom-transcript.txt. Save it in a folder with your personal repo / homework to work on together with an invisible xml grammar file.

Your task is to create an invisible XML grammar that represents a good XML model of your choice, organizing this information into elements and/or attributes. 

## Coping with Ambiguity
**Ambiguity** or **ambiguous parsing** in Invisible XML means there's more than one way to interpret the grammar when applying it to the source document. For more on coping with ambiguity, see [David Birnbaum's helpful explanation](https://dh.obdurodon.org/ixml-ambiguity.xhtml). 

## When you're finished 
When you're producing good XML in your shell, you want to save that! With coffeepot, you add the `-o:` command at the end to define where you want to save output. When you run this, you won't see the XML output in your shell anymore. Browse to where you said to save the file and open it in oXygen to see how it turned out!

```shell
coffeepot -g:yourGrammar.ixml -i:zoom-transcript.txt  -o:zoom-transcript.xml
```
Try this out in blitz too!  In Markup Blitz. Add a `>` and a filename.xml to store your output like this:

```shell
blitz yourGrammar.ixml  zoom-transcript.txt  > zoom-transcript.xml
```
### What to submit on Canvas

* your Invisible XML grammar (.ixml)
* the output XML (.xml) if you were successful)
* a message in the text box on how this went, if you produced ambiguous XML, or (if you weren't successful with outputting XML) indicating what's wrong and what you attempted to fix it.