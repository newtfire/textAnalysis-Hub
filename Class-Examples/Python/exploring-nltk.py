# We need to install nltk first: in your shell or the Pycharm terminal, run:
# pip install nltk
# Because I am running multiple versions on my machine, I will specify:
# python3.12 -m pip install nltk.
# Then we can import it.
import nltk
import nltk.corpus
# The next line downloads all the example texts used in the NLTK book at https://www.nltk.org/book !
nltk.download('book')
from nltk.book import *
from urllib import request


# NEED THESE IMPORT LINES FOR HANDLING PLOTS
import matplotlib
import matplotlib.pyplot as plt
import tk

# TEST IF GRAPHING WORKS:
# plt.plot(range(10))
# plt.show()

# words = ["whale", "sea", "ship", "captain"]
# nltk.draw.dispersion_plot(text1, words)
# plt.show()


text2.common_contexts(["monstrous", "very"])

# text4.dispersion_plot(["citizens", "democracy", "freedom", "duties", "America"])
# plt.show()

# nltk.download('gutenberg')
# nltk.corpus.gutenberg.fileids()

# print(text1.similar('monstrous'))
# print(set(text4))


# Let's open Crime & Punishment from Project Gutenberg to ask Python to read it.

# bookurl= "https://www.gutenberg.org/cache/epub/2081/pg2081.txt"
# # Project Gutenberg's text file for Blithedale Romance
# response = request.urlopen(bookurl)
# br = response.read().decode('utf8')
# type(br)
# print(len(br))
# print(br[:500])
# for word in br.split():
#     if word.endswith('ing'):
#          print(word)


## Make a Text Concordance
# emma = nltk.Text(nltk.corpus.gutenberg.words('austen-emma.txt'))
# print(len(emma))
# print(emma.concordance("surprize"))


from nltk.corpus import inaugural
inaugural.fileids()
cfd = nltk.ConditionalFreqDist(
    (target,fileid[:4])
    for fileid in inaugural.fileids()
    for w in inaugural.words(fileid)
    for target in ['america', 'citizen']
    if w.lower().startswith(target))
cfd.plot()
plt.show()










