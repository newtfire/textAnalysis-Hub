# Python Natural Language Processing Exercise 2

This exercise is designed to build on [our Python NLP Exercise 1](https://github.com/newtfire/textAnalysis-Hub/blob/main/python-nlp-exercise1.md), which asked you to work with some text you pulled via XQuery from your semester project files, and prepare a workspace in your personal GitHub repo for doing NLP processing work with Python. You may continue with the same text, or pull more text or a different selection of text for this round. Just make sure when you submit your work for the assignment that you send the current text file you're exploring with Python.

## Objectives
In this exercise, you will be:
* Learning to write a Python function that pulls NLP data you're interested in from spaCy. You'll choose one of the NLP "tags" of information that you can pull with spaCy to help you extract something of a kind: all the nouns or verbs, or all the named entities that are associated with cultural identity or geographic information. 
* Learning to work with a Counter function from the Python standard collections library. This will help us do the equivalent of *taking distinct values* and *counting* instances in the file of a particular phenomenon that spacy's NLP has tagged. 
* Continue practicing with for loops and functions to understand how to return data in the console.
* Learning how to work with a graphing library for Python to make an SVG bar graph. We'll work with the pygal library for this. **You will need to install pygal at command line (in your Git Bash (Windows) or Terminal (Mac)** To do this use:
```
pip install pygal
```
* Learning (throughout this process) how to work with imports from multiple libraries (collection, pygal, as well as spacy).

We will work together in class on one or more sample files for this exercise, drawing on text from various student projects. We recommend referring to [our sample file here](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/Python/nlp/nlp2.py) to adapt to your project. I will expect you to do more than just the minimum to adapt this file, and to adapt it mindfully, showing that you understand what we're doing in each step. (Feel free to add comments to explain what's going on, since this will help you later!) Your goal is to alter this file to do some natural language processing of your own and explore something of specific interest to your project. More sample Python files are appearing in this GitHub repo under [Class Examples >> Python >> nlp](https://github.com/newtfire/textAnalysis-Hub/tree/main/Class-Examples/Python/nlp).

## Step-by-step

1. Prepare your text file for this project. Pull text from the XML nodes you care about for the project, such as all the speeches, all the stage directions, etc into a text file, saved as .txt, to explore with NLP.

     * **Fine print**: (You may also wish to work with a collection of text files addressing them with a **for-loop** to open and read them with nlp. For help with this consult with Dr. B, and we have a somewhat-more-complicated-than-you-need [example in the Blues team repo](https://github.com/am0eba-byte/blues/blob/main/python/bluesLyricParser.py). It's complicated because we were reading in badly-formatted old HTML files there and needing to convert them to text documents, which you won't need to do because you're starting with clean XML code to generate texts. As we work over collections of your files together, we'll make a simpler example for the class. Or you can simply "dump" all the text drawn from your collection into a big text document, which is perfectly fine. ) 

2. Write / adapt my script to investigate your text with spaCy. My recommendation is to explore a range of things for a while and decide on what looks most interesting and reasonably accurate. For example, you can try a named entity search using:

```
for entity in grimmNLP.ents:
        print(entity.text, entity.label_, spacy.explain(entity.label_))
```

The `spacy.explain()` function will explain the meaning of the various labels you'll see. Some of these may look laughably wrong! When that is the case, you are seeing where [automated natural language processing needs to be *trained* to fully work](https://www.technologyreview.com/2020/11/18/1012234/training-machine-learning-broken-real-world-heath-nlp-computer-vision/), and commonly we're seeing issues with mis-identifying names, works of art, organizations, for example. With more time, we can *train* NLP to recognize these named entitites more accurately, often done using XML markup. We don't necessarily need to do that for our simple introductory purposes, though, if some set of the tagging is reasonably accurate and informative. Explore for a while and see if Part of Speech tagging or Named Entity tagging looks interesting. Then see if you can narrow this down to some *particular* category of tagging that you'd want to feature for your project. What if you looked at all the verbs or nouns together? Or, what names of geopolitical entities is spaCy finding? 

3. Decide on some NLP tag that you want to collect and count. Once you've decided that, we'll need to **modify our Python function that helps collect information**. 
Find that function in the document, remembering from our intro tutorials that Python functions begin with `def function-name(argument)`. That is written to indicate the function's name, and its structure. NOTE: The text you see inside the `( )`, the *argument*, is meant to be descriptive, *not* an actual name of a variable that you'll be feeding the function. So you can basically just say `def verbcollector(nlpDoc)` or `def verbcollector(textnlp)` or something meaningful for you to remind you of *what kind of thing* you need to supply to this function.  Then, later on in your Python file, you **call** the function by its name, and give it the variable it needs to run, something like this:

```python
listVerbs = verbcollector(disneywords)
```
Our variable `disneywords` was defined up in the document something like this: `disneywords = nlp(disneysongs.read())`, and it stores the result of running spaCy's `nlp()` function over some text we read from the Disney Songs project.

  To collect the NLP tag you want to collect: Add an `if` statement and a variable for holding a list to the Python script. (You'll see something like this in my example scripts, this time from the Grimm project): 

```python
def cardinalcollector(nlpDoc):
    cardinals = []
    for entity in grimmNLP.ents:
        if entity.label_ == "CARDINAL":
            print(entity.text, entity.label_, spacy.explain(entity.label_))
            cardinals.append(entity.text)
    return cardinals
```

In this case, I decided to look at all the cardinal numbers spaCy could find in the Grimm Fairy Tales text. I created an empty list to contain them with 
```python
cardinals = []
```
Then I wrote a `for loop` to look through all the named entities spaCy could locate in the grimm text that I'd run through `nlp()` earlier in [this sample file](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/Python/nlp/nlp-sentences.py). I added an `if` statement to test whether an `entity.label` would exactly match the string "CARDINAL", and in that case, I would print them out (so I could see them in the console), and also append them to my list of cardinals that I set up as empty before my for-loop. As the for-loop turns, it collects each named entity whose label is "CARDINAL". 

Because I wrote this as a function, I need to return the value, which is the list of cardinals.  I also need to **call** or inititiate the function by creating what information I want to send to it. I do this just after defining the function on line 29 of my sample file:

```python
listCardinals = cardinalCollector(grimmNLP)
```

This says, send my grimm text that I read with nlp earlier up to the `cardinalCollector()` function. The return of that function is stored in the variable `listCardinals` and I can work with it. 

4. Now, we work with our collection of information! We'd like to count the number of times the members of our list show up in the text file we read. If this were XQuery, we'd do this with XPath `distinct-values()` and `count()` functions. Python has a library we can import that handles this work in its own way, and we're going to try it out here. At the top of your Python file, add (or copy in from my file) the following line:

```python
from collections import Counter
```

(You shouldn't have to install collections in your command line or Terminal because it comes built-in with Python 3.) 
With `Counter` imported, we can use it as a function: Try it on the list of items you collected from your nlp counter function (and see my sample code). Counter comes with a `most_common()` feature which you can append to a new variable to make a top 5, top 10, top 20 (etc) result list. Experiment. I also added some code to look at the least frequent things on a list, and you'll probably recognize the slicing going on there.

**NOTE on result datatypes**: The results of `Counter()` is a Python dictionary with `key value` pairs. However, the result of adding `.most_common()` is a `list of tuples`. That affects how we can pull text and number from the results in the next steps! 
First just **print** the results of these functions to your console, and when you're seeing and understanding the data, you're ready for the next step! 

5. Since we have frequency counts for each distinct member of a list, we can graph this information! Let's try this in the Pythonic way by importing a graphing library. We'll use pygal, which is known to make lovely, interactive SVG graphs. 

     * At the top of your file, **add a line to import our graphing library**: `import pygal`
          * If you have trouble with this import, you may still need to **install pygal from command line**. In your Git Bash (Windows) or Terminal (Mac), enter `pip install pygal`. Once that installs, go back to Python, and hover over the import line with your mouse. All should be well. 

     * In my [sample code](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/Python/nlp/nlp2.py), I actually created *two* bar graphs from different sets of results to explore how to "feed" data in different ways into the pygal graphing functions. 
          * I made one bar graph from the dictionary results of the `Counter()` function which isolated when the frequency count was greater than 10
          * I made a second bar graph in the way that's probably better (more visually pleasing because it comes out sorted properly). This one I made using the list of tuples from `.most_common(10)` (my top ten list from the `Counter()`).
     * **Your task is to read and adapt my code from lines 44 onward to generate a bar graph!** (You don't have to make two graphs; just one. But feel free to explore and experiment and make as many as you like.) The lines at the end of the file show you how to output an SVG file using the pygal graphing library:

```python
bar_chartTopTen.render_to_file('bar_chartTopTen.svg')
```

This will save the output SVG to your project directory (and you should be able to see that in the left-hand project directory panel in PyCharm). Open a web browser to that local project directory to view your output file! Here's a preview of how ours turned out: 

<img src="https://raw.githubusercontent.com/newtfire/textAnalysis-Hub/main/Class-Examples/Python/nlp/bar_chartTopTen.svg" width="80%" alt="Top Ten Verbs in the Disney Songs project collection, with their frequencies"/>

6. **What to submit on Canvas:**
     * Upload your Python file (`.py` extension)
     * Upload a copy of the the text file (or files) you processed (`.txt` extension)
     * Upload a copy of your output SVG file. (`.svg` extension)
