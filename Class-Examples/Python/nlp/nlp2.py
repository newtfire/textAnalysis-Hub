# Objective for Python Ex 2: explore lemmas and POS and named entities in your text blobs
# Try counting the top 10 or 20 of a thing
# Try a basic Python plotting library to create an SVG: We'll try Pygal
# See https://towardsdatascience.com/interactive-data-visualization-in-python-with-pygal-4696fccc8c96

from collections import Counter
import pygal
import spacy
# Need line 10 the first time: Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')
lemmatizer = nlp.get_pipe("lemmatizer")
# print(lemmatizer.mode)  # 'rule'

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
        if token.pos_ == "ADJ":
            count += 1
            # print(count, ": ", token.text, " lemma: ", token.lemma_, " pos: ", token.pos_)
            # don't forget the underscore after token.lemma_ , token.pos_, etc.!
            Adj.append(token.lemma_)
            print(count, ": ", token, token.pos_, spacy.explain(token.pos_))
    # print(count, ": ", adjectives)
    return Adj

listAdj = adjcollector(disneywords)
adj_freq = Counter(listAdj)
# most_common() converts the Counter's dictionary to a tuple series and sorts it
sortedAdj = adj_freq.most_common()
topTen = adj_freq.most_common(10)
print(topTen)
lastTen = adj_freq.most_common()[:-11:-1]
print(lastTen)

# ebb: Okay, let's try out the pygal graphing library!
# Here I am experimenting and creating TWO bar graphs. For homework you only need to create one.
# I made one bar graph called bar_chartOver10, and another that I like much better called bar_chartTopTen
bar_chartOverTen = pygal.Bar()
bar_chartTopTen = pygal.Bar()

bar_chartOverTen.title = 'Adjectives Repeated More than Ten Times in the Disney Songs Collection'
bar_chartTopTen.title='The Top Ten Adjectives Used in Disney Songs'

# for a in adj_freq:
#     # adj_freq is a dictionary structure, so we return its key and its value:
#     # print(a, adj_freq[a])
#     if adj_freq[a] > 5:
#         bar_chartOver5.add(a, adj_freq[a])

for s in sortedAdj:
    if s[1] > 10:
        bar_chartOverTen.add(s[0], s[1])

for t in topTen:
    # this is a list of tuples with word and number, so we return its values like this:
    print(t[0], t[1])
    bar_chartTopTen.add(t[0], t[1])

# print(bar_chart)
print(bar_chartOverTen.render(is_unicode=True))
bar_chartOverTen.render_to_file('bar_chartOver5.svg')
bar_chartTopTen.render_to_file('bar_chartTopTen.svg')


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



