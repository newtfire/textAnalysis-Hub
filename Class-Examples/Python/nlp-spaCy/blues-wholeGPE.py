from collections import Counter
import pygal
import spacy

nlp = spacy.load('en_core_web_sm')
lemmatizer = nlp.get_pipe("lemmatizer")

lyrics = open('blues-wholeCollectionLyrics.txt', 'r')
words = lyrics.read()
lyricsWords = nlp(words)

def entcollector(words):
    Ents = []
    count = 0
    for entity in lyricsWords.ents:
        if entity.label_ == "GPE" and entity.text != "BB" and entity.text != "Angelina" and entity.text != "Tellin":
            count += 1
            print(count, ": ", entity.text, entity.label_)
            Ents.append(entity.lemma_)
    return Ents


listEnts = entcollector(lyricsWords)
# print(listEnts)
ent_freq = Counter(listEnts)
entAll = ent_freq.most_common()
entTopTwenty = ent_freq.most_common(20)
print(entTopTwenty)
entLastTen = ent_freq.most_common()

# ebb: Okay, let's try out the pygal graphing library!
# Here I am experimenting and creating TWO bar graphs. For homework you only need to create one.
# I made one bar graph called bar_chartOver10, and another that I like much better called bar_chartTopTen

bar_chartTopTwenty = pygal.Bar()
bar_chartAll = pygal.Bar()


bar_chartTopTwenty.title='Top 20 Places in Blues Collection'
bar_chartAll.title = 'All Places in Blues Collection'


for t in entTopTwenty:
    # this is a list of tuples, so we return its values like this:
    print(t[0], t[1])
    bar_chartTopTwenty.add(t[0], t[1])

for t in entAll:
    # this is a list of tuples, so we return its values like this:
    print(t[0], t[1])
    bar_chartAll.add(t[0], t[1])

# print(bar_chart)
bar_chartTopTwenty.render_to_file('bar_chartBluesTop20GPE.svg')
bar_chartAll.render_to_file('bar_chartBluesAllGPE.svg')


