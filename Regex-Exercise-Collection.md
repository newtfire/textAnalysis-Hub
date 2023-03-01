## Regex Exercise: Bojack Horseman or your own project collection

This exercise is designed to familiarize you with regex Find and Replaced operations over a collection of files. We'll be continuing to work with the oXygen XML Editor to help us view matches before we replace. It's also possible to do regular expression match and replace operations using programming code such as Python's re library or XSLT's analyze-string, and we can explore that in your projects if you like. We find oXygen especially helpful for seeing matches as you're testing regular expressions.

### Working with oXygen's Find/Replace in Files
To this point, we have been working with one file at a time, using the Find/Replace window. For working with a collection of files, go to the Find menu and familiarize yourself with Find/Replace in files. The options are different here. 

<img width="600" alt="oxygenFindReplaceFiles" src="oxygenFindReplaceFiles.png">

At the top, mark the Regular expression option and decide whether you want to select Dot matches all. (We have it marked in the screen capture, but remember, you should only mark it when you want to the dot to match over every character including return characters in all the lines within a document.) 

For Find/Replace in files, we set a scope to a Specified path, and here you can click the folder to browse to the directory you are working with. 

Try out a Find in the window for a pattern you know you will see in your collection to get started and make sure everything is working, and see how oXygen's Results window displays returns for particular files. Here is a sample view of the return window for the search featured above, seeking representations of musical passages in the Bojack Horseman HTML subtitles files. You can scroll through results by file here, and select a result to view it in its file. Try clicking on a result to open the file and see it highlighted in context. 


<img width="600" alt="oxygenFindReplaceFiles" src="FindReplaceFiles-Return.png">

### Your Assignment

For this assignment, you may work with a collection of Bojack Horseman files I have scraped from their source at <https://queerworm.github.io/transcripts/>, or you may work with a collection of files that you have collected for your project.

Your task is analyze your documents carefully and first make a plan for the information structure you wish to create with them for XML. If it helps to work over one or two representative files first with the original Find /Replace window, do that. 




