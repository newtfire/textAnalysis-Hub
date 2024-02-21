import spacy
import os, shutil
# FOR XML OUTPUT:  install dicttoxml
from dicttoxml import dicttoxml
# install xml.dom.minidom
from xml.dom.minidom import parseString
# FOR DATAFRAMES OUTPUT
import pandas as pd
# FOR JSON OUTPUT
import json

# Need line 4 the first time: Then comment it out after the first time you run it:
#nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')

workingDir = os.getcwd()
#print("Current working directory: " + workingDir)
insideDir = os.listdir(workingDir)
#print("Files and Directories contained within: " + str(insideDir))

CollPath = os.path.join(workingDir, 'prompts')
#print(CollPath)

workingWord = 'neutral'
similarityIndex = .4

def readTextFiles(filepath, word):
    with open(filepath, 'r', encoding='utf8') as f:
        readFile = f.read()
        stringFile = str(readFile)
        lengthFile = len(readFile)
        #print(lengthFile)

        tokens = nlp(stringFile)
        vectors = tokens.vector

        wordOfInterest = nlp(word)
        #print('Word of interest: ',wordOfInterest, ': ', wordOfInterest.vector_norm)

        highSimilarityDict = {}
        for token in tokens:
            if (token and token.vector_norm):
                if wordOfInterest.similarity(token) > similarityIndex:
                    highSimilarityDict[str(token)] = wordOfInterest.similarity(token)
                    # The line above creates the structure for each entry in my dictionary.
                    #print(token.text, " is about this much similar to ", wordOfInterest, ": ", wordOfInterest.similarity(token))

        filteredDictionary = {}
        for key,value in highSimilarityDict.items():
            if key not in filteredDictionary.items():
                filteredDictionary[key] = value

        #Now sort the values of filteredDictionary
        #Using a bubble sort
        keys = [key for key in filteredDictionary.keys()]
        values = [value for value in filteredDictionary.values()]
        for i in range(len(values)):
            for j in range(len(values) - i - 1):
                if values[j] < values[j + 1]:
                    values[j], values[j + 1] = values[j + 1], values[j]
                    keys[j], keys[j + 1] = keys[j + 1], keys[j]

        #Create our sorted dictionary from two sorted lists
        sortedDictionary = {}
        for i in range(len(keys)):
            sortedDictionary[keys[i]] = values[i]

        #print("This is a dictionary of words most similar to the word " + wordOfInterest.text + " in this file.")
        #print(sortedDictionary)
        #print("Total dictionary size: ", len(sortedDictionary))

        return sortedDictionary

# EMPTY and CREATE THREE OUTPUT FOLDERS:
shutil.rmtree("JSON-output")
shutil.rmtree("csv-output")
shutil.rmtree("xml-output")
os.mkdir('JSON-output')
os.mkdir('csv-output')
os.mkdir('xml-output')


for file in os.listdir(CollPath):
    if file.endswith(".txt"):
        filepath = f"{CollPath}/{file}"
        print(filepath)
        filenameTxt = os.path.basename(filepath).split('/')[-1]
        filename = filenameTxt[:-4]
        print(filename)
        similarityData = readTextFiles(filepath, workingWord)

        # ============================================ #
        # JSON: DICTIONARY OUTPUT METHOD 2
        # ============================================ #
        # JSON stands for JavaScript Object Notation
        # It's an adaptable file serialization format for dictionary structures used for web programming
        stringKeys = {str(key): val for key, val in similarityData.items()}
        print(f'{stringKeys=}')
        with open(f'JSON-output/{filename}{workingWord.upper()}.json', 'w') as fp:
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
        df.to_csv(f'csv-output/{filename}{workingWord.upper()}.tsv', sep='\t', index=False, encoding='utf-8')
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
        with open(f'xml-output/{filename}{workingWord}.xml', 'w') as xmlFile:
            xml_decode = xml.decode()
            xmlFile.write(xml_decode)
            xmlFile.close()