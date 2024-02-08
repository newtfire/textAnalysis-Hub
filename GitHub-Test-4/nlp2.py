import os
import spacy
#nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')
workingDir = os.getcwd()
print("current working directory:" + workingDir)
insideDir = os.listdir(workingDir)
print("inside this directory are the following files AND directories: " + str(insideDir))
CollPath = os.path.join(workingDir, 'aitexts')
#print(CollPath)
#aitext has three documents. Two of them have the same prompt.
def readTextFiles(filepath):
    with open(filepath, 'r') as f:
        readFile = f.read()
        # print(readFile)
        stringFile = str(readFile)
        lengthFile = len(readFile)
        print(lengthFile)
        tokens = nlp(stringFile)
        # playing with vectors here
        vectors = tokens.vector
        wordOfInterest = nlp(u'legend')
        print(wordOfInterest, ': ', wordOfInterest.vector_norm)
        highSimilarityDict = {}
        for token in tokens:
            if (token and token.vector_norm):
                # if token not in highSimilarityDict.keys(): # Alas, this did not work to remove duplicates from my dictionary. :-(
                if wordOfInterest.similarity(token) > .4:
                    highSimilarityDict[token] = wordOfInterest.similarity(token)
        print(highSimilarityDict)

    for file in os.listdir(CollPath):
        if file.endswith(".txt"):
            filepath = f"{CollPath}/{file}"
        print(filepath)
        readTextFiles(filepath)
