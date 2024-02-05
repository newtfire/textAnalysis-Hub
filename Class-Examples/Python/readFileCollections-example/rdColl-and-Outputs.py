# Our challenge: read in multiple text files from a directory:
# Our resource: The Python os module + a handy code example:
#  https://www.geeksforgeeks.org/how-to-read-multiple-text-files-from-folder-in-python/
import spacy
import os, shutil
# What is os? This is a library that allows Python to read your operating system (os).
# This will let Python read and interpret file paths on your local computer.
# shutil will let us remove unwanted files from a directory.

# FOR XML OUTPUT:  install dicttoxml
from dicttoxml import dicttoxml
# install xml.dom.minidom
from xml.dom.minidom import parseString

# FOR DATAFRAMES OUTPUT
import pandas as pd

# FOR JSON OUTPUT
import json


# nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')
# AFTER THE FIRST DOWNLOAD, COMMENT OUT the spacy.cli.download(...) variable.
# Your spaCy language model will already be stored in your Python environment.
# ABOUT WHAT SPACY SHOULD LOAD: Some tutorials direct us to en_core_web_md
# There are _sm, _md, and _lg models built into spaCy. Each takes up more space than the others, but
# contains more data so may be more accurate/precise.
# If we try the sm model, we're told that it does not have word vectors loaded, so it uses tagger, parser and NER (named
# entity recognition to calculate similarity instead. Better to switch to the md model--but worth comparing results!

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

        wordOfInterest = nlp(u'panic')
        # print(wordOfInterest, ': ', wordOfInterest.vector_norm)

        # Now, let's open an empty dictionary! We'll fill it up with the for loop just after it.
        # The for-loop goes over each token and gets its values
        highSimilarityDict = {}
        for token in tokens:
            if (token and token.vector_norm):
                # if token not in highSimilarityDict.keys(): # Alas, this did not work to remove duplicates from my dictionary. :-(
                if wordOfInterest.similarity(token) > .3:
                    highSimilarityDict[token] = wordOfInterest.similarity(token)
                    # The line above creates the structure for each entry in my dictionary.
                    # print(token.text, "about this much similar to", wordOfInterest, ": ", wordOfInterest.similarity(token))
        print("This is a dictionary of words most similar to the word " + wordOfInterest.text + " in this file.")
        print(highSimilarityDict)

        # ebb: When I printed the highSimilarityDict, I noticed that there are duplicate entries.
        # I tried a couple of strategies to remove them. One is commented-out above.
        # dict.fromkeys() did not work because of Python's assumption that a dictionary's keys are already unique.

        # ebb UPDATE 2024-02-04: Here are a couple of good ways to remove duplicates from the dictionary:
        print("\n\n DICTIONARY COMPREHENSION TO DEDUPE THE DICTIONARY. "
              "\n I like this method because it's short and and whimsical."
              "\n It pulls a switcheroo! Keys become values in the first dictionary comprehension."
              "\n 'Deduping' happens because when a duplicate token is read as a *value* it is removed."
              "\n Then we reverse again and make the tokens be keys in the shorter dictionary."
              "Source: https://tutorial.eyehunts.com/python/python-remove-duplicates-from-dictionary-example-code/ ")
        switcheroo = {val: key for key, val in highSimilarityDict.items()}
        deduped = {val: key for key, val in switcheroo.items()}
        print(str(len(switcheroo)) + ' **** ' + f'{switcheroo=}')

        print(len(deduped), ' **** ', f'{deduped=}')
        print(len(deduped.items()), " vs ", len(highSimilarityDict.items()))

        print("\n\nLONGHAND WAY: REMOVES DUPLICATE VALUES ONLY (WON'T WORK ON JUST KEYS)"
              "\n Source: https://tutorial.eyehunts.com/python/python-remove-duplicates-from-dictionary-example-code/")
        highSimilarityReduced = {}
        for key, value in highSimilarityDict.items():
            if value not in highSimilarityReduced.values():
                highSimilarityReduced[key] = value
        print(highSimilarityReduced)
        print(len(highSimilarityReduced.items()), " vs ", len(highSimilarityDict.items()))

        print("Now it's YOUR TURN! How will you sort your dictionary?"
              "\n Read the comments in the code at this point to get you started.")

        # ebb: For this next part, it's YOUR TURN to write some modifying code.
        # We should sort the highSimilarityReduced dictionary by values from high to low,
        # but sorting is a little tricky because we need to isolate the **value**
        # not the key.
        # HOW TO DO IT? SEE https://www.freecodecamp.org/news/sort-dictionary-by-value-in-python/
        # NOTE: After you sort, your results won't be a dictionary any more!
        # So you should read the WHOLE tutorial to see how to convert this back into a dictionary again
        # and do that in your code here.

        sortedSimValues = sorted(deduped.items(), key=lambda x: x[1], reverse=True)
        print(type(sortedSimValues), f'{sortedSimValues=}')
        # HEY, that's not a dictionary! It's a list. Let's convert it back to a dictionary.

        sortedSimDict = dict(sortedSimValues)
        print(type(sortedSimValues), f'{sortedSimValues=}')

        return sortedSimDict


# ebb: This controls our file handling as a for loop over the directory:
with open('similarityReadings.txt', 'a', encoding='utf8') as f:
    for file in sorted(os.listdir(CollPath)):
        # My filenames are numbered, so I controlled the order of the for loop by sorting them.
        if file.endswith(".txt"):
            filepath = f"{CollPath}/{file}"
            print(filepath)
            similarityData = readTextFiles(filepath)
            f.write(filepath + '\n')
            f.write(str(similarityData) + '\n\n')
    # ***************  HOW TO OUTPUT DICTIONARY STRUCTURES  ****************
    # If we convert it to a string, it comes out as a list of tuples.
    # That's okay, but it's not a great data structure to work with.
    # Let's try outputting a few different data structures from a dictionary

    # ============================================ #
    # PICKLING: DICTIONARY OUTPUT METHOD 1
    # ============================================ #
    # This would make a .pkl binary file object, not readable as a string of text,
    # but preserving the data structure as a dictionary. You import the pickle module to do this.
    # Python serializes and deserializes "pickle" files as data objects. Works inside total Python environments.
    # For more on pickling your data, see https://www.datacamp.com/tutorial/pickle-python-tutorial
    # The rest of the data formats are for serializing in forms of text media:

 # ============================================ #
    # DICTIONARY OUTPUTS TO TEXT MEDIA FORMATS
    # ============================================ #
    # We will output each of the TEXT MEDIA outputs INSIDE THE FOR LOOP to create well-formed outputs:

# EMPTY and CREATE THREE OUTPUT FOLDERS:
# First check and see, do these folders exist? If so, remove them
# because Python won't allow you to overwrite them
if os.path.exists("JSON-output"):
    shutil.rmtree("JSON-output")
if os.path.exists("csv-output"):
    shutil.rmtree("csv-output")
if os.path.exists("xml-output"):
    shutil.rmtree("xml-output")

os.mkdir('JSON-output')
os.mkdir('csv-output')
os.mkdir('xml-output')

for file in sorted(os.listdir(CollPath)):
    # My filenames are numbered, so I controlled the order of the for loop by sorting them.
    if file.endswith(".txt"):
        filepath = f"{CollPath}/{file}"
        print(filepath)
        filenameTxt = os.path.basename(filepath).split('/')[-1]
        filename = filenameTxt[:-4]
        print(filename)
        similarityData = readTextFiles(filepath)

        # ============================================ #
        # JSON: DICTIONARY OUTPUT METHOD 2
        # ============================================ #
        # JSON stands for JavaScript Object Notation
        # It's an adaptable file serialization format for dictionary structures used for web programming
        stringKeys = {str(key): val for key, val in similarityData.items()}
        print(f'{stringKeys=}')
        with open(f'JSON-output/{filename}.json', 'w') as fp:
            JSON = json.dumps(stringKeys)
            print(f'{JSON=}')
            json.dump(stringKeys, fp)

        # ============================================ #
        # PANDAS DATA FRAMES: DICTIONARY OUTPUT METHOD 3
        # ============================================ #
        # Data Frames are used heavily in data analytics.
        # They make a tabular (table) structure and are easily output as a CSV or TSV text file
        df = pd.DataFrame.from_dict(similarityData.items(), orient="columns")
        df.columns = ['token', 'similarity']
        print(df)
        df.to_csv(f'csv-output/{filename}.tsv', sep='\t', index=False, encoding='utf-8')
        # I want to make a tsv file (tab-separated values), so I'm using the \t here.
        # to make a comma-separated values csv, put in a ','

    # ============================================ #
    # XML: DICTIONARY OUTPUT METHOD 4
    # ============================================ #
    # This tutorial is good: https://www.geeksforgeeks.org/serialize-python-dictionary-to-xml/
        xml = dicttoxml(similarityData)
        dom = parseString(xml)
        # dom is just a string. We can pretty print it in the console,
        # but this is not good for writing to an XML file.
        print(dom.toprettyxml())
        with open(f'xml-output/{filename}.xml', 'w') as xmlFile:
            xml_decode = xml.decode()
            xmlFile.write(xml_decode)
            xmlFile.close()








