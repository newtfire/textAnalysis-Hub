# Explore NLTK on your files / project files

## All set?
You're ready for this exercise if: 

* You have created a directory in your personal repo for working on Python
* You have configured a Virtual Environment there and know how to activate it on your computer system.
* You know how to install Python libraries in your Virtual Environment with pip.
* You know how to run a Python file in your activated Virtual Environment in your command line terminal and/or the VSCode terminal.

If you're not ready, go back and review / redo the previous assignments in this series to make sure you're all systems go for running Python and working with natural language processing.

## Tinker with NLP and NLTK

Start by reading and exploring the code in the NLTK book chapters 1 and 2. 

1.  [Language Processing and Python](https://www.nltk.org/book/ch01.html)
2.  [Accessing Text Corpora and Lexical Resources](https://www.nltk.org/book/ch02.html) 

You can run these by:
*  Activating your Virtual Environment in a shell (either in VS Code or your own command line). 
*   You probably did this in the last assignment, but in case you skipped it: do some pip installs in your Virtual Environment to start working with NLTK and the matplotlib library for plotting visualizations from some of the text analysis calculations:

```python
pip install nltk
pip install matplotlib
```
* To start tinkering with code, make sure your venv is still active. You'll see (venv) or ((venv)) in your prompt.  You can open an interactive Python interface in your shell with `python` and work directly with Python and libraries you've imported now. Once in the Python interface in your shell, you'll see `>>>` in your prompt.

* When you're ready to write your own Python files, you can exit the interactive Python interface with `quit()`. In VSCode, open the folder where you've set up your Virtual Environment and start a new Python file.
*  Set up or be ready to write relative filepaths to text files on your computer or you can read in text files from an online source. 
    * For this assignment, just start with one file you've set in your workspace, stored as `.txt` . 
         * In case you need to prepare this, we'll show you how to pull just the text you want from XML files and output as text via XSLT. Here's [an example in the textAnalysis-Hub](https://github.com/newtfire/textAnalysis-Hub/tree/main/Class-Examples/Python/xml-to-text-for-python).
         * Moving to processing a directory of files requires a little more setup and a function to move through them: we'll set that up next time.
    * **Write a Python program that opens your text file** and practices at least three different kinds of NLP analysis that you're learning in these chapters. 
          * For NLTK to work on this file, you need to prepare it as a list of tokens, and prepare it as a special NLTK Text Object: Here's [a starter Python file](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/Python/nltkStarter-yourOwnFile.py) to help show you how to do that. 
     * With your new file open and working as an NLTK Text Object, write scripts that help you explore the language in your text following Chs. 1 and 2. You could:
         * Check the **lexical diversity** of the file.
              * How does this compare to other files? You could try looking at a second project file and test *its* lexical diversity in order to compare it, or compare it against one of the NLTK sample texts.
      *  Look for words most **similar** to a word you're interested in.
      *  What are the most common, frequently used words in the text? 
      *  Compare the **frequency distribution** of a few words of interest.
      *  See if you can plot graphs when you run your code. To set this up / smoke test graphing with tkinter and matplotlib in your shell from Python, make sure you install and import what you need for that:
          * matplotlib for frequency distributions: see [my sample code, plt-necessities.py](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/Python/plt-necessities.py)
          * for tkinter, follow our sample code in [this notebook](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/Python/readFileCollections-examples/Exploring-NLTK.ipynb).
               * By the way, Jupyter notebooks (like the one I just linked) are a nifty combination of markdown and Python code that you run portions of your Python code in cells. We'll set up notebooks in our next class, but you can read about what you need and try it yourself in VSCode. Before you can set up a notebook, you'll need install the Jupyter package with `pip install Jupyter` in your Virtual Environment. 
      
* Push your text file(s) and your Python file to your repo.  

## What to submit on Canvas

1. A link to your personal GitHub repo that shows your .gitignore and your text file(s) + python (.py) file that you've prepared for this exercise. Let me know in the text / comment box on Canvas what directory to find your Python file.
2. Comment in the text box about a discovery you made about your text(s) by doing this homework. 


         
    










