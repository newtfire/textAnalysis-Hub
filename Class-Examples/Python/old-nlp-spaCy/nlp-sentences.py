import spacy
from collections import Counter

nlp = spacy.load('en_core_web_sm')
grimm = open('grimm.txt', 'r', encoding='utf8')
grimmDoc = grimm.read()
grimmNLP = nlp(grimmDoc)
grimmmSentences = grimmNLP.sents

def sentenceLengths(sentences):
    lengths = []
    for s in sentences:
        length = len(s.text)
        lengths.append(length)
    return sorted(lengths)


grimmLengths = sentenceLengths(grimmmSentences)
# print(grimmLengths)
maxVal = max(grimmLengths)
minVal = min(grimmLengths)
print('The shortest sentence is ' + str(minVal) + ' characters long.')
print('The longest sentence is ' + str(maxVal) + ' characters long.')

for sentence in grimmNLP.sents:
#    print(sentence.text)
    length = len(sentence.text)
    if length == minVal:
        print("The shortest sentence is: " + sentence.text)
    if len(sentence.text) == maxVal:
        print('The longest sentence is: ' + sentence.text + ' :' + str(maxVal) + 'characters')

def cardinalcollector(nlpDoc):
    cardinals = []
    for entity in grimmNLP.ents:
        if entity.label_ == "CARDINAL":
            print(entity.text, entity.label_, spacy.explain(entity.label_))
            cardinals.append(entity.text)
    return cardinals

listCardinals = cardinalcollector(grimmNLP)
print(listCardinals)
cardinal_freq = Counter(listCardinals)
topTen = cardinal_freq.most_common(10)
print(topTen)

# for entity in grimmNLP.ents:
#         # if entity.label_ == "CARDINAL":
#         print(entity.text, entity.label_, spacy.explain(entity.label_))

