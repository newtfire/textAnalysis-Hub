# STAGE 3: Let's map the named entity tokens into the source files,
# and output some text files containing the NLP data on the way.
# pip install saxonche
# The library above lets you read and pull data with XPath
import os
import spacy
import re as regex
from saxonche import PySaxonProcessor
# ebb: The line above imports the PySaxonProcessor from SaxonCHE (free "home edition")
# for work with XPath


# nlp = spacy.cli.download("en_core_web_lg")
nlp = spacy.load('en_core_web_lg')
# ebb: In the line above I'm loading one of the spaCy language models: use either _md or _lg.
# If you change versions, you need to uncomment the line above and import it, and it can take
# a little while to finish importing.
# LOTR PROJECT NOTE: When I ran this with the _md language model, Frodo was being tagged as a PRODUCT.
# The _lg model seemed more accurate (Frodo as PERSON)

# workingDir = os.getcwd()
# print("source-txt" + workingDir)
#
# insideDir = os.listdir(workingDir)
# print(str(insideDir))
#
# CollPath = os.path.join(workingDir, '../source-xml')
# print(CollPath)
###############################################################################
################################################################################
# 1. ebb: CollPath can also simply be defined more simply as a relative path
# defined from this Python file's location, like this, because you climb up one directory
# and then down into your source XML files:
##################################################################################
CollPath = '../source-xml'
TargetPath = '../taggedOutput'

# 3. Here, the function imports each individual file, one at a time
# (received from the for-loop below.
def readTextFiles(filepath):
    # with open(filepath, 'r', encoding='utf8') as f:
    with PySaxonProcessor(license=False) as proc:
        xml = open(filepath, encoding='utf-8').read()
        # ebb: Here we changed to the Saxon processor to read files with XPath.
        # From here on, we change how we formulate the string that Python will send to NLP.
        xp = proc.new_xpath_processor()
        node = proc.parse_xml(xml_text=xml)
        xp.set_context(xdm_item=node)

        xpath = xp.evaluate('//book//p ! normalize-space() => string-join()')
        # ebb: Let's get the string() value of all the <p> elements that are descendants of <book>.
        # The XPath function normalize-space() gets the string value and removes extra spaces.
        # That way we avoid the prologue, preface material.
        # I'm sending the whole thing to string-join() to bundle it together as one string
        # instead of a new string for every <p> element.
        # string = xpath.__str__()
        string = str(xpath)

        # ebb: Using REGEX to remove element tags for the moment so they don't get involved in the NLP.
        # elementsRemoved = regex.sub('<.+?>', '', xpath)
        # ebb: Now I don't have to remove elements because I pulled a string value out of my XML.
        # Should we remove the single quotation marks? Not sure. If we do, uncomment the next line:
        # cleanedUp = string.replace("'", '')
        # ebb: I noticed some sentences didn't have a space between end punctuation and the first word of the next sentence.
        cleanedUp = regex.sub("(\.)([A-Z']])", "\1 \2", string)
        # NOT REALLY DOING THIS, but just for illustration if we want to continue refining the input in multiple stages:
        # cleanedUp = regex.sub("(\d)", "NUMBER", cleanedUp)
        # print(cleanedUp)
        tokens = nlp(cleanedUp)
        # print(tokens)
        listEntities = entitycollector(tokens)
        # ebb: The line above sends our nlp tokens to the named entity collector function.
        # THIS current function will receive and print a simple form of their output in the next line.
        # print(listEntities)
        return(listEntities)

#########################################################################################
# ebb: NEXT AFTER RETURNING ALL THE ENTITIES
# Remove duplicates (get the distinct values of the list of entities (DONE! below)
# Output this information in a useful way (TO DO)
# Map it back into the XML files (TO DO)
##########################################################################################

# 4. ebb: The function below returns a simple list of named entities.
# But on the way, we're printing out as much we can from spaCy's classification of named entities:
def entitycollector(tokens):
    with open('output.txt', 'w') as f:
        entities = []
        for entity in sorted(tokens.ents):
        # if entity.label_ == "NORP" or entity.label_ == "LOC" or entity.label_=="GPE":
        # ebb: The line helps experiment with different spaCy named entity classifiers, in combination if you like:
        # When using it, remember to indent the next lines for the for loop.
            # print(entity.text, entity.label_, spacy.explain(entity.label_))
            entityInfo = [entity.text, entity.label_, spacy.explain(entity.label_)]
            stringify = str(entityInfo)
            print(stringify)
            f.write(stringify)
            f.write('\n')
        # PRINT TO FILE
            entities.append(entity.text)
        print(f"{entities=}")
        return entities
    # ebb: Keep the return line in position at same indentation level as the definition of the entities variable.


# 2. ebb: The for loop below is working with your CollPath, and going through each file inside,
# and sending it up to readTextFiles, where the nlp processing will happen.
def assembleAllNames(CollPath):
    AllNames = []
    for file in os.listdir(CollPath):
        if file.endswith(".xml"):
            filepath = f"{CollPath}/{file}"
            # print(filepath)
            # print(readTextFiles(filepath))
            eachFileList = readTextFiles(filepath)
            print(eachFileList)
            AllNames.append(eachFileList)
    # print(AllNames)
    # print(len(AllNames))
    # ebb: Okay. Now let's return distinct values of this giant list!
    # ebb: NOTE: AllNames is a list of 3 nested lists (one for each book of LOTR, or each turn of the for loop.
    # We need to flatten the nested list before we can properly get distinct values from it.
    # We'll use a list comprehension for that.
    flatList = [element for innerList in AllNames for element in innerList]
    # ebb: This strange looking thing in the line above is a "list comprehension". It unpacks elements from the 3 inner lists
    # and organizes them out on the same level.
    distinctNames = sorted(set(flatList))
    # ebb: Converting a list to a set() removes duplicates from the list. Yay. Sort them to make them easier to review.
    print(f"{distinctNames=}")
    print('AllNames Count: ' + str(len(AllNames)) + ' : ' + 'Distinct Names Count: ' + str(len(distinctNames)) + ' : ' + 'flatList Count ' + str(len(flatList)))
    # Let's write just the sorted names to an output file, because we can!
    with open('distNames.txt', 'w') as f:
        f.write(str(distinctNames))

    # ebb: FINALLY, let's tag these distinct names in our source XML
    for file in os.listdir(CollPath):
        if file.endswith(".xml"):
            sourcePath = f"{CollPath}/{file}"
            eachFileList = xmlTagger(sourcePath, distinctNames)

    return distinctNames
def xmlTagger(sourcePath, distinctNames):
    with open(sourcePath, 'r', encoding='utf8') as f:
        readFile = f.read()
        stringFile = str(readFile)

        # ebb: Get the current filename. We need to know it to write its new output version
        filename = os.path.basename(f.name)
        print(f"{filename=}")
        targetFile = f"{TargetPath}/{filename}"
        print(f"{targetFile=}")

        # ebb: Work with stringFile variable to look for matches from the distinctNames set.
        for d in distinctNames:
            replacement = '<name>' + d + '</name>'
            print(f"{replacement=}")
            stringFile = stringFile.replace(d, replacement)
            print(f"{stringFile=}")

        # ebb: Output goes in the taggedOutput directory: ../taggedOutput
        with open(targetFile, 'w') as f:
            f.write(stringFile)










assembleAllNames(CollPath)

# ebb: The functions are all initiated here now.
# This just delivers the collection path up to the first function in the sequence.