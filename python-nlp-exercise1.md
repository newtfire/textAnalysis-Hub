# Python Natural Language Processing Exercise 1

At this point, you've finished the PyCharm Community introduction to Python series of tutorials, and we're ready to start writing simple Python programs. 
Python lets us work with natural language processing libraries, like NLTK and Spacy, to assist with retrieving data about words. 
These libraries represent the cumulative work of decades of computational linguistics, which apply statistics to predict the most likely parts of speech of particular words, draw on information to identify the base word forms (or lemmas) of words in a document, and identify patterned language like proper names in text documents and collections.

Python is among the most popular ways to access packages or libraries for natural language processing, and allows us to explore texts based on the sequences of words,
seeing them in a structured flow or network. In our introduction to natural language processing, we'll explore and experiment to see what we can see about project texts.

## Stage 1: Find some project text to play with
Prepare some plain text pulled from your project documents. Write XQuery that reaches for the `string()` values of the elements that represent a unit of text in your project.
You could start by pulling text from a single chapter or section just for our first exercise. Or try pulling all the speeches or music lyrics and isolating just one "kind" of text.

Write XQuery in eXist-dB to pull out some text, and save it in a .txt file. Download that and save it in your personal (individual) GitHub repos for the purposes of this exercise.
(We can decide together later next week which if your Python experiments should be built into your semester project. For now, to avoid merge and Python environment conflicts, we'll experiment in the individual context of your personal repos.)

Here is an example XQuery file for addressing the Disney Songs collection and pulling text of just the song lyrics:

```
xquery version "3.1";
declare variable $ThisFileContent := string-join(
let $disneySongs := collection('/db/disneySongs/')
let $songs := $disneySongs//song ! normalize-space()
   (: normalize-space() basically combines the string() function and removes spaces between nodes, :)
   (: so it's an efficient text-scraper. :)
return $songs, "&#10;");
   (: We're using our newline character here to put a hard return between songs :)

let $filename := "disneySongLyrics.txt"
let $doc-db-uri := xmldb:store("/db/2021-ClassExamples/", $filename, $ThisFileContent, "text/plain")
return $doc-db-uri 
(: View this text file at http://newtfire.org:8338/exist/rest/db/2021-ClassExamples/disneySongLyrics.txt  :)
```

## Stage 2: Make a directory for your Python experiments in your personal GitHub repo
Make a directory in your personal GitHub repo for saving your Python work. In that directory, save the text file(s) you're isolating to work with.

## Start a new project in Pycharm in your new Python directory
* In Pycharm Edu, go to File >> New Project. 
* Browse to your local GitHub directory and select it as the location of your new project. 
    * You may be prompted to open a starter "main.py" file, and you may do this if you wish (it's just a starter file: you can delete its contents and write your own code or adapt ours.)
    * You may also just Make a new Python file by going to File >> New and selecting Python file. 
* To work with our starter file from class, go to your local copy of our `textAnalysis-Hub`, do a `git pull`. 
* [Our Python sample files](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/Python/nlp/nlp1.py) are stored in Class Examples >> Python. **Try opening our Python files in oXygen or a different text editor**, so you can copy and adapt my code in your project you're setting up in Pycharm.

## Installing spaCy
Since this is (very likely) the first time you've worked with spaCy, you will need to install it before it can be available to work with in your Python program. 

* To install spaCy, on Windows, use the Git Bash Shell, and on Mac or Linux, use your Terminal. 
* We will work with **pip** the Python default package manager that came with your Python installation. (You can read [more about pip here](https://realpython.com/what-is-pip/) which shows you how to access it and more about its various commands and Python package management generally.)
* Following [spaCy's instructions](https://spacy.io/usage#installation) for intallation, you will need to enter these commands in your Git Bash Shell (Windows) or Terminal (Mac / Linux):

```
pip install -U pip setuptools wheel
pip install -U spacy
```
Watch for spacy to install. 
   * If all goes well, success! Go on to the next section. You'll be ready to work with spaCy back in Pycharm.
   * On Windows you may see a permissions error something like this: 

```
ERROR: Could not install packages due to an EnvironmentError: [WinError 5] 
Access is denied: 'c:\\program files\\python38\\lib\\site-packages\\pip-19.2.3.dist-info\\entry_points.txt'
```

If you see this error, try running the following in your Git Bash shell
```
python -m pip install -U pip --user
```
Along the way, you may be prompted to upgrade pip. If so, follow the messages you're seeing in your Bash shell or Terminal for how to do this, most likely with:
```
python -m pip install --upgrade pip
```

Then try re-entering the pip commands above for the setuptoolswheel and to install spaCy. If you are still seeing errors, report in our Slack in the `#python` channel, and we'll work on debugging and update our notes here. 


## Write some Python code to do the following: 
* Open and read your text file drawn from your project
* Check to make sure your Pycharm configuration is working (Pycharm will help with this as you press the green arrow to run your code)
* Convert the document to a string
* At the top of the file, import the spacy module as shown in my sample code (let's make sure Pycharm imports this)
* For the first time, add this line to important space's core English linguistics stats package: 
```
nlp = spacy.cli.download("en_core_web_sm")
```
After the first run, you won't need this line anymore
* Add 
```
nlp = spacy.load('en_core_web_sm')
```
* **Now, read the first 3 sections of the spaCy.io guide**: https://spacy.io/usage/spacy-101#whats-spacy 
    * [What's spaCy?](https://spacy.io/usage/spacy-101#whats-spacy)
    * [Features](https://spacy.io/usage/spacy-101#features)
    * [Linguistics Annotations](https://spacy.io/usage/spacy-101#annotations)
* Process your project text with the `nlp()` function, and use spaCy's tokenization algorithm to explore one of the linguistics annotations features documented there. You can also try adapting and building on the code we shared from class for this. 
* Our goal is to get you up and running with writing some natural language processing code in Python and see some results printed to your console. Use the `print()` commands we've been using to view whether your for loops and variables are working. Write comments in your code if you get stuck. 
* Save your code, add, commit, and push it to your personal GitHub repo. And file your Python code and its text file on Canvas for this homework assignment. 
* When you've completed this, you're ready to move on to [our Python NLP Exercise 2](python-nlp-exercise2.md).


