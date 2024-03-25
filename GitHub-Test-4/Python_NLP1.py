import spacy

# Need line 8 the first time: Then comment it out after the first time you run it:
# There are medium and large models
# nlp = spacy.cli.download("en_core_web_md")
nlp = spacy.load('en_core_web_md')

grimm = open('grimm.txt', 'r', encoding='utf8')
words = grimm.read()
wordings = str(words)
# print(wordings)
# changed the name print in line 10
# start playing with spaCy and nlp:
avatarWords = nlp(wordings)   # changed the print name
for token in avatarWords:
    if token.pos_ == "VERB":
        continue_stmt = "continue"
        print(token.text, ":::::::::", token.pos_, "******", token.lemma_)
        # changed the format for line 18
