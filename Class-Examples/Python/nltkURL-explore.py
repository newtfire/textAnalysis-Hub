# We need to install nltk first: in your shell or the Pycharm terminal, run:
# pip install nltk
# Because I am running multiple versions on my machine, I will specify:
# python3.12 -m pip install nltk.
# Then we can import it.
import nltk
import nltk.corpus
from urllib import request
# The next line downloads all the example texts used in the NLTK book at https://www.nltk.org/book !
nltk.download('book')
from nltk.book import *
import matplotlib
import tkinter

# nltk.download('gutenberg')
nltk.corpus.gutenberg.fileids()

# print(text1)
#print(text1.similar('monstrous'))
print(set(text3))


# Let's open Crime & Punishment from Project Gutenberg to ask Python to read it.

# pgCPurl= "http://www.gutenberg.org/files/2554/2554-0.txt"
# Project Gutenberg's text file for Crime and Punishment
# response = request.urlopen(pgCPurl)
# pgCP = response.read().decode('utf8')
# type(pgCP)
# print(len(pgCP))
# print(pgCP[:500])
# for word in pgCP.split():
#     if word.endswith('ing'):
#         print(word)


## Make a Text Concordance
emma = nltk.Text(nltk.corpus.gutenberg.words('austen-emma.txt'))
# print(len(emma))
# print(emma.concordance("surprize"))






