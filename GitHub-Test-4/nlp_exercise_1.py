import spacy

nlp = spacy.load('en_core_web_sm')

doc = open('kah-chatgpt-results.txt', 'r', encoding="utf8")
text = doc.read()
textStrings = str(text)
print(textStrings)

words = nlp(textStrings)
for token in words:
    print(token.text, token.pos_)
    # This labels all parts of speech in my entire ChatGPT experiment about Shadow the Hedgehog haikus,
    # even my requests and suggestions I made as I went.

for ent in words.ents:
    print(ent.text, ent.start_char, ent.end_char, ent.label_)

for token in words:
    print(token.shape_)

for token in words:
    print(token.has_vector, token.vector_norm, token.is_oov)

for token in words:
    if token.pos_ == "ADJ":
        print(token.text)
    # This lists all adjectives in the chat and poems, but some of them are innacurate.

for token in words:
    if token.pos_ == "VERB":
        print(token.text, ":", "The base word is", token.lemma_)
# At first, I used the above part for adjectives, but then I made it for verbs to make it more accurate.