import spacy
# nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')
# AFTER THE FIRST DOWNLOAD, COMMENT OUT the spacy.cli.download(...) variable.
# There are _sm, _md, and _lg models built into spaCy. Each takes up more space than the others, but
# contains more data so may be more accurate/precise.
# If we try the sm model, we're told that it does not have word vectors loaded, so it uses tagger, parser and NER (named
# entity recognition to calculate similarity instead. Better to switch to the md model--but worth comparing results!
import os, shutil
# What is os? This is a library that allows Python to read your operating system (os).
# This will let Python read and interpret file paths on your local computer.

# FOR XML OUTPUT
from dicttoxml import dicttoxml
# xml.dom.minidom comes with Python so you have it already
from xml.dom.minidom import parseString
# FOR DATAFRAMES OUTPUT
import pandas as pd
# FOR JSON OUTPUT
import json

# LOAD THE SPACY LANGUAGE MODEL: choices are _sm, _md, _lg, but _sm won't work here.
# nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')

# First, we need to set up Python to read input files from a directory
# We'll use os to identify a file directory with text files to explore:
# os.cwd returns the current working directory path (where you're saving your Python file)!
workingDir = os.getcwd()
print("current working directory: " + workingDir)

# os.listdir lists files and folders inside a path:
insideDir = os.listdir(workingDir)
print("inside this directory are the following files AND directories: " + str(insideDir))

# use os.path.join to connect the subdirectory to the working directory:
CollPath = os.path.join(workingDir, 'texts')
print(f'{CollPath=}')

# The next cell contains a LOT of code!
# We have our function for reading the text files and performing spaCy's NLP functions on them.
# AND we include the file input that feeds the function. This has to come after the function,
# because the function needs to be defined before you can call it to run over files.
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

        wordOfInterest = nlp(u'cyber')
        # print(wordOfInterest, ': ', wordOfInterest.vector_norm)

        # Now, let's open an empty dictionary! We'll fill it up with the for loop just after it.
        # The for-loop goes over each token and gets its values
        highSimilarityDict = {}
        for token in tokens:
            if wordOfInterest.similarity(token) > .3:
                highSimilarityDict[token] = wordOfInterest.similarity(token)
                # The line above creates the structure for each entry in my dictionary.
                # print(token.text, "about this much similar to", wordOfInterest, ": ", wordOfInterest.similarity(token))
        print("This is a dictionary of words most similar to the word " + wordOfInterest.text + " in this file.")
        print(highSimilarityDict)

        switcheroo = {val: key for key, val in highSimilarityDict.items()}
        deduped = {val: key for key, val in switcheroo.items()}

        sorted_deduped = sorted(deduped.items(), key=lambda x: x[1], reverse=True)
        # print(sorted_deduped)
        converted_dict = dict(sorted_deduped)
        print(converted_dict)
        return converted_dict
#         I didn't have this return line originally and it was messing me up. Thanks, Dr. B- Tyler


# ebb: This controls our file handling as a for loop over the directory:
with open('similarityReadings.txt', 'a', encoding='utf8') as f:
    for file in sorted(os.listdir(CollPath)):
        # My filenames are numbered, so I controlled the order of the for loop by sorting them.
        if file.endswith(".txt"):
            filepath = f"{CollPath}/{file}"
            print(filepath)
            similarityData = readTextFiles(filepath)

            # LET'S WRITE OUR DICTIONARY TO A NICE TEXT OUTPUT FILE WHILE WE'RE WORKING ON FILE INPUTS / OUTPUTS!
            f.write(filepath + '\n')
            f.write(str(similarityData) + '\n\n')

            # I had this commented out while fixing my return line, I suppose I could technically let these lines run now.- Tyler
            # xml = dicttoxml(similarityData)
            # dom = parseString(xml)
            # # dom is just a string. We can pretty print it in the console,
            # # but this is not good for writing to an XML file.
            # print(dom.toprettyxml())
            # with open(f'xml-output/{filename}.xml', 'w') as xmlFile:
            #     xml_decode = xml.decode()
            #     xmlFile.write(xml_decode)
            #     xmlFile.close()