import os
import spacy
import re as regex
# ebb: I'm adding one more import line that we'll use for regex substitutions later

# nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')
# ebb: In the line above I'm loading one of the spaCy language models: use either _md or _lg.
# If you change versions, you need to uncomment the line above and import it, and it can take
# a little while to finish importing.

workingDir = os.getcwd()
print("source-txt" + workingDir)

insideDir = os.listdir(workingDir)
print(str(insideDir))

CollPath = os.path.join(workingDir, '../source-xml')
print(CollPath)
# 1. ebb: CollPath can also simply be defined more simply as a relative path
# defined from this Python file's location, like this, because you climb up one directory
# and then down into your source XML files:
CollPath = '../source-xml'

# 3. Here, the function imports each individual file, one at a time
# (received from the for-loop below.
def readTextFiles(filepath):
    with open(filepath, 'r', encoding='utf8') as f:
    # ebb: In the line above, you need 'r' to indicate you've opened this to read data from it.
    # (The alternative is 'w' whic means you're opening the file to write data into it.)
        print(filepath)
        # Your filepaths should output properly now.
        readFile = f.read()
        stringFile = str(readFile)
        # ebb: Using REGEX to remove element tags for the moment so they don't get involved in the NLP.
        elementsRemoved = regex.sub('<.+?>', '', stringFile)
        tokens = nlp(elementsRemoved)
        # print(tokens)
        listEntities = entitycollector(tokens)
        # ebb: The line above sends our nlp tokens to the named entity collector function.
        # THIS current function will receive and print a simple form of their output in the next line.
        print(listEntities)

# 4. ebb: The function below returns a simple list of named entities.
# But on the way, we're printing out as much we can from spaCy's classification of named entities:
def entitycollector(tokens):
    entities = []
    for entity in tokens.ents:
        # if entity.label_ == "NORP" or entity.label_ == "LOC" or entity.label_=="GPE":
        # ebb: The line helps experiment with different spaCy named entity classifiers, in combination if you like:
        # When using it, remember to indent the next lines for the for loop.
        print(entity.text, entity.label_, spacy.explain(entity.label_))
        entities.append(entity.text)
    return entities
    # ebb: Keep the return line in position at same indentation level as the definition of the entities variable.

# 2. ebb: The for loop below is working with your CollPath, and going through each file inside,
# and sending it up to readTextFiles, where the nlp processing will happen.
for file in os.listdir(CollPath):
    if file.endswith(".xml"):
        filepath = f"{CollPath}/{file}"
        # print(filepath)
        readTextFiles(filepath)
