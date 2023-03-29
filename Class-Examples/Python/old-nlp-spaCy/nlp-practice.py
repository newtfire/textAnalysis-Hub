# start with Grimm project file. Pull its tagged words. Also pull its whole text.
# objective: Learn to open and read in data from files.
# play with spaCy
# If necessary (probably not?) at Git Bash or terminal do: pip3 install spacy

from collections import Counter
import spacy
# Need line 8 the first time: Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')
lemmatizer = nlp.get_pipe("lemmatizer")
print(lemmatizer.mode)  # 'rule'


disneysongs = open('disneySongLyrics.txt', 'r')
words = disneysongs.read()
# print(words)

count = 0
disneyWords = nlp(words)
count = 0
listWords = []
sortedWords = sorted(disneyWords)
for token in sortedWords:
    count += 1
    listWords.append(token.lemma_)
    print(count, ": ", token)

slicedList = set(listWords[0:20])
c = 0
for s in slicedList:
    c += 1
    print(c, ": ", s)

for entity in disneyWords.ents:
    if entity.label_ == "NORP":
        print(entity.text, entity.label_, spacy.explain(entity.label_))

print(list(disneyWords.sents))
