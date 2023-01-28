# Our challenge: read in multiple text files from a directory:
# Our resource: The Python os module + a handy code example:
#  https://www.geeksforgeeks.org/how-to-read-multiple-text-files-from-folder-in-python/

import os

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
        print(readFile)
        stringFile = str(readFile)
        lengthFile = len(readFile)
        print(lengthFile)


# ebb: add that utf8 encoding argument to the open() function to ensure that reading works on everyone's systems
# this all succeeds if you see the text of your files printed in the console.


for file in os.listdir(CollPath):
    if file.endswith(".txt"):
        filepath = f"{CollPath}/{file}"
        print(filepath)
        readTextFiles(filepath)
