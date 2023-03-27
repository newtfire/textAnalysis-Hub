from collections import Counter
import pygal
import spacy
# Need line 8 the first time: Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')
lemmatizer = nlp.get_pipe("lemmatizer")
print(lemmatizer.mode)  # 'rule'

koh = open('KOHsample.txt', 'r', encoding="utf8", errors="ignore")
# If, when you print the file, it comes out with weird characters in place of apostrophes, quotes, etc.,
# try adapting this alternative version of the line above:
# yourtext = open('yourtext.txt', 'r', encoding="utf8", errors='ignore')
kohRead = koh.read()
kohinput = nlp(kohRead)
# print(kohinput)

def verbcollector(words):
    Verbs = []
    count = 0
    for token in words:
        if token.pos_ == "VERB":
            count += 1
            # print(count, ": ", token.text, " lemma: ", token.lemma_, " pos: ", token.pos_)
            # don't forget the underscore after token.lemma_ , token.pos_, etc.!
            Verbs.append(token.lemma_)
            print(count, ": ", token, token.pos_, spacy.explain(token.pos_))
    # print(count, ": ", Verbs)
    return Verbs

listVerbs = verbcollector(kohinput)
print(listVerbs)
verb_freq = Counter(listVerbs)
topTen = verb_freq.most_common(10)
print(topTen)
lastTen = verb_freq.most_common()[:-5:-1]
print(lastTen)

# ebb: Okay, let's try out the pygal graphing library!
# Here I am experimenting and creating TWO bar graphs. For homework you only need to create one.
# I made one bar graph called bar_chartOver10, and another that I like much better called bar_chartTopTen
bar_chartTopTen = pygal.Bar()

bar_chartTopTen.title='Top 10 Verbs in Kingdom of Hearts Sample Text'

for t in topTen:
    # this is a list of tuples, so we return its values like this:
    print(t[0], t[1])
    bar_chartTopTen.add(t[0], t[1])

# print(bar_chart)
print(bar_chartTopTen.render(is_unicode=True))
bar_chartTopTen.render_to_file('koh-bar_chartTopTenVerbs.svg')
