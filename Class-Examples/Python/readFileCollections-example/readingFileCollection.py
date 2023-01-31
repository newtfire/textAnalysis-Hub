# Our challenge: read in multiple text files from a directory:
# Our resource: The Python os module + a handy code example:
#  https://www.geeksforgeeks.org/how-to-read-multiple-text-files-from-folder-in-python/
import spacy
# nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')
# ABOUT WHAT SPACY SHOULD LOAD: Some tutorials direct us to en_core_web_md
# There are _sm, _md, and _lg models built into spaCy. Each takes up more space than the others, but
# contains more data so may be more accurate/precise. Let's just start small with _sm.
import numpy as np
# not sure I'm really using numpy
import os

##############################
# OBJECTIVE: Find out which words in my document are most similar to a particular word of interest
# How to find this using spaCy similarity vectors?

# Helpful resource for spaCy similarity calculation based on a selected word:
# https://stackoverflow.com/questions/55921104/spacy-similarity-warning-evaluating-doc-similarity-based-on-empty-vectors
##############################

# ebb: The os module comes with python so you probably don't have to install it.
# Just add the import line

# commenting out in Pycharm: find keystroke under Code >> Comment with linecomment

# ebb: Identify a file directory with text files to explore:
# ebb: os.cwd returns the current working directory path

workingDir = os.getcwd()
print("current working directory: " + workingDir)

# os.listdir lists files and folders inside a path:
insideDir = os.listdir(workingDir)
print("inside this directory are the following files AND directories: " + str(insideDir))

# use os.path.join to connect the subdirectory to the working directory:
CollPath = os.path.join(workingDir, 'textCollection')
print(CollPath)

def readTextFiles(filepath):
    with open(filepath, 'r', encoding='utf8') as f:
        readFile = f.read()
        # print(readFile)
        stringFile = str(readFile)
        lengthFile = len(readFile)
        print(lengthFile)
# ebb: add that utf8 encoding argument to the open() function to ensure that reading works on everyone's systems
# this all succeeds if you see the text of your files printed in the console.
        tokens = nlp(stringFile)
        # playing with vectors here
        vectors = tokens.vector
        # word3vector = tokens[3].vector
        # print(word3vector)
        # for token in tokens:
            # print(token.text)
            # if token.text == 'public':
            #     print("found public! ")
            # print(token.text, token.vector_norm)
            # if token.text == "public":
            #     print (token.text + " found!")
        wordOfInterest = nlp(u'panic')
        # print(wordOfInterest, ': ', wordOfInterest.vector_norm)
        # Open an empty dictionary to populate with the for loop over the tokens:
        highSimilarityDict = {}
        for token in tokens:
            if(token and token.vector_norm):
                if token not in highSimilarityDict.keys():
                    if wordOfInterest.similarity(token) > .3:
                        highSimilarityDict[token] = wordOfInterest.similarity(token)
                        # print(token.text, "about this much similar to", wordOfInterest, ": ", wordOfInterest.similarity(token))
        print("This is a dictionary of words most similar to the word " + wordOfInterest.text + " in this file.")
        # print(highSimilarityDict)
        # ebb: I notice that there are duplicates in my highSimilarityDict dictionary. Let's remove them.
        # I'm fixing that with help from the last example on this handy page:
        # https://tutorial.eyehunts.com/python/python-remove-duplicates-from-dictionary-example-code/
        highSimilarityReduced = {}
        for key, value in highSimilarityDict.items():
            if value not in highSimilarityReduced.values():
                highSimilarityReduced[key] = value
        print(highSimilarityReduced)
        print(len(highSimilarityReduced.items()), " vs ", len(highSimilarityDict.items()))

        # ebb: For this next part, it's your turn to write some modifying code.
        # We should sort the highSimilarityReduced dictionary by values from high to low,
        # but sorting is a little tricky because we need to isolate the **value**
        # not the key. See https://www.freecodecamp.org/news/sort-dictionary-by-value-in-python/ for example of how to do it.
        # NOTE: After you sort, your results won't be a dictionary any more, so you should read the WHOLE tutorial to see
        # how to convert this back into a dictionary again and do that in your code here.

# ebb: This controls our file handling as a for loop over the directory:
for file in os.listdir(CollPath):
    if file.endswith(".txt"):
        filepath = f"{CollPath}/{file}"
        print(filepath)
        readTextFiles(filepath)
