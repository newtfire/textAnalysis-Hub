#Objective for Python Ex 2: explore lemmas and POS and named entities in your text blobs
# Try counting the top 10 or 20 of a thing
# Try a basic Python plotting library to create an SVG: We'll try Pygal
# See https://towardsdatascience.com/interactive-data-visualization-in-python-with-pygal-4696fccc8c96

from collections import Counter
import numpy as np
import seaborn as sns
import spacy

# Need line 8 the first time: Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')
lemmatizer = nlp.get_pipe("lemmatizer")
print(lemmatizer.mode)  # 'rule'

disneysongs = open('disneySongLyrics.txt', 'r')
# If, when you print the file, it comes out with weird characters in place of apostrophes, quotes, etc.,
# try adapting this alternative version of the line above:
# yourtext = open('yourtext.txt', 'r', encoding="utf8", errors='ignore')
words = disneysongs.read()
disneywords = nlp(words)
# print(words)


def adjcollector(words):
    Adj = []
    count = 0
    for token in words:
        if token.pos_ == "NOUN":
            count += 1
            # print(count, ": ", token.text, " lemma: ", token.lemma_, " pos: ", token.pos_)
            # don't forget the underscore after token.lemma_ , token.pos_, etc.!
            Adj.append(token.lemma_)
            print(count, ": ", token, token.pos_, spacy.explain(token.pos_))
    # print(count, ": ", Verbs)
    return Adj

listAdj = adjcollector(disneywords)
adj_freq = Counter(listAdj)
topTen = adj_freq.most_common()
print(topTen)
lastTen = adj_freq.most_common()[:-5:-1]
# print(lastTen)

# ebb: Okay, let's try out the pygal graphing library!
# Here I am experimenting and creating TWO bar graphs. For homework you only need to create one.
# I made one bar graph called bar_chartOver10, and another that I like much better called bar_chartTopTen
# bar_chartOver10 = sns.catplot(x=??, y=??)
# FIND OUT HOW TO CALL X AND Y FROM DATA ON ADJECTIVES
# bar_chartTopTen = sns.catplot()

# bar_chartOver10.title = 'Noun Lemma Forms in Disney Songs'
# bar_chartTopTen.title='All Noun Lemmas in Disney Songs'

for a in adj_freq:
    # verb_freq is a dictionary structure, so we return its key and its value:
    print(a, adj_freq[a])
    if adj_freq[a] > 10:
        sns.catplot(x=a, y=adj_freq[a], palette="pastel", edgecolor=".6")


# for t in topTen:
#     # this is a list of tuples, so we return its values like this:
#     print(t[0], t[1])
#     bar_chartTopTen.add(t[0], t[1])
#
# # print(bar_chart)
# print(bar_chartOver10.render(is_unicode=True))
# bar_chartOver10.render_to_file('bar_chartOver10.svg')
# bar_chartTopTen.render_to_file('bar_chartTopTen.svg')


# On windows ctrl / comments out blocks.
# On mac command / comments out blocks

# lowercaseList = []
# for l in listVerbs:
#     l = str(l).lower()
#     lowercaseList.append(l)
# setVerbs = set(lowercaseList)
# count = 0
# for s in setVerbs:
#     count += 1
# print(sorted(setVerbs))
# print(count)
