import spacy
# Need line 8 the first time: Then comment it out after the first time you run it:
# There are medium and large models
# nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')

grimm = open('grimm.txt', 'r', encoding='utf8')
words = grimm.read()
wordstrings = str(words)
# print(wordstrings)

# start playing with spaCy and nlp:
avatarWords = nlp(wordstrings)
for token in avatarWords:
    if token.pos_ == "VERB":
        print(token.text, ":::::::::", token.pos_, "******", token.lemma_)
