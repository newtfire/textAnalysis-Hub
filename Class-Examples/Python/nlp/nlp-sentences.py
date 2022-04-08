import spacy
from collections import Counter

nlp = spacy.load('en_core_web_sm')
grimm = open('grimm.txt', 'r')
grimmDoc = grimm.read()
grimmNLP = nlp(grimmDoc)
maxVal = 0
for sentence in grimmNLP.sents:
    print(sentence.text)
    length = len(sentence.text)
    print(length)
    if length > maxVal: maxVal = length

# for sentence in grimmNLP.sents:
#     length = len(sentence.text)
#     if length == maxVal:
#         print(sentence)
#         print(length)

def cardinalcollector(nlpDoc):
    cardinals = []
    for entity in grimmNLP.ents:
        if entity.label_ == "TIME":
            print(entity.text, entity.label_, spacy.explain(entity.label_))
            cardinals.append(entity.text)
    return cardinals

listCardinals = cardinalcollector(grimmNLP)
# print(listCardinals)
cardinal_freq = Counter(listCardinals)
topTen = cardinal_freq.most_common(10)
print(topTen)

# for entity in grimmNLP.ents:
#         # if entity.label_ == "CARDINAL":
#         print(entity.text, entity.label_, spacy.explain(entity.label_))

