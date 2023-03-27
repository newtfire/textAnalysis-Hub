import spacy
from collections import Counter
# Need line 4 the first time: Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')

avatarSpeeches = open('avatarSpeeches.txt', 'r', encoding='utf8' )
words = avatarSpeeches.read()
avatarNLP = nlp(words)


def verbCollector(words):
    VerbLemmas = []
    for token in words:
        if token.pos_ == "ADJ":
            print(str(token.lemma) + ' : ' + str(token.lemma_))
            VerbLemmas.append(token.lemma_)
    # Now use the amazing python Counter() to take distinct values and
    # count how often each distinct lemma is used in the collection,
    # and sort from most to least frequent!
    # Counter() makes a "tuple" data structure (two parts separated by a colon):
    # {term: count, term: count, term: count }
    LemmasCounted = Counter(VerbLemmas)
    print(LemmasCounted)
    # most_common() function takes distinct values and counts and sorts from most to least

    return LemmasCounted

            # print(token.text, "---->", token.pos_, ":::::", token.lemma_)

avatarVerbs = verbCollector(avatarNLP)
lemmacount = len(avatarVerbs)
print('There are ' + str(lemmacount) + ' distinct lemma adjective forms in the Avatar series.')
top20 = avatarVerbs.most_common(20)
print(top20)


