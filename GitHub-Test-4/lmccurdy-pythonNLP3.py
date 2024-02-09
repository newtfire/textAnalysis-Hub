import spacy
import os, shutil

from dicttoxml import dicttoxml
from xml.dom.minidom import parseString

import pandas as pd

import json

nlp = spacy.load('en_core_web_md')

workingDir = os.getcwd()
print("current working directory: " + workingDir)

insideDir = os.listdir(workingDir)
print("inside this directory are the following files AND directories: " + str(insideDir))

CollPath = os.path.join(workingDir, 'ai-text-collection-nlp3')
print(f'{CollPath=}')


def readTextFiles(filepath):
    with open(filepath, 'r', encoding='utf8') as f:
        readFile = f.read()
        # print(readFile)
        stringFile = str(readFile)
        lengthFile = len(readFile)
        print(lengthFile)

        tokens = nlp(stringFile)

        vectors = tokens.vector


        wordOfInterest = nlp(u'town')
        print(wordOfInterest, ' : ', wordOfInterest.vector_norm)

        highSimilarityDict = {}
        for token in tokens:
            if (token and token.vector_norm):
                if wordOfInterest.similarity(token) > .3:
                    # added str here as dicttoxml was giving me errors
                    highSimilarityDict[str(token)] = wordOfInterest.similarity(token)
                    # The line above creates the structure for each entry in my dictionary.
                    # print(token.text, "about this much similar to", wordOfInterest, ": ", wordOfInterest.similarity(token))
        print("This is a dictionary of words most similar to the word " + wordOfInterest.text + " in this file.")
        print(highSimilarityDict)

        print("\n\n DICTIONARY COMPREHENSION TO DEDUPE THE DICTIONARY. ")

        switcheroo = {val: key for key, val in highSimilarityDict.items()}
        deduped = {val: key for key, val in switcheroo.items()}
        print(str(len(switcheroo)) + ' **** ' + f'{switcheroo=}')

        print(len(deduped), ' **** ', f'{deduped=}')
        print(len(deduped.items()), " vs ", len(highSimilarityDict.items()))

        sortedSimValues = sorted(deduped.items(), key=lambda x: x[1], reverse=True)
        print(type(sortedSimValues), f'{sortedSimValues=}')

        sortedSimDict = dict(sortedSimValues)
        print(type(sortedSimValues), f'{sortedSimValues=}')

        return sortedSimDict


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

        stringKeys = {str(key): val for key, val in similarityData.items()}
        print(f'{stringKeys=}')
        with open(f'JSON-output/{filename}.json', 'w') as fp:
            JSON = json.dumps(stringKeys)
            print(f'{JSON=}')
            json.dump(stringKeys, fp)

        df = pd.DataFrame.from_dict(similarityData.items(), orient="columns")
        df.columns = ['token', 'similarity']
        print(df)
        df.to_csv(f'csv-output/{filename}.tsv', sep='\t', index=False, encoding='utf-8')

        xml = dicttoxml(similarityData)
        dom = parseString(xml)
        # dom is just a string. We can pretty print it in the console,
        # but this is not good for writing to an XML file.
        print(dom.toprettyxml())
        with open(f'xml-output/{filename}.xml', 'w') as xmlFile:
            xml_decode = xml.decode()
            xmlFile.write(xml_decode)
            xmlFile.close()























