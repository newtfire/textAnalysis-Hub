import spacy

nlp = spacy.load('en_core_web_sm')

chatResults = open('ahopple-chatgpt-results.txt', 'r', encoding="utf8")
words = chatResults.read()
wordStrings = str(words)
print(wordStrings)

chatWords = nlp(wordStrings)
# Here is a list of items and character names, as well as the foods that are mentioned as a part of the recipe.
# It is not perfect, but I am new to Python and spaCy.
print("Characters and Items")
for token in chatWords:
    if token.pos_ == "PROPN":
        print(token.text)
# I originally recycled this line of code to experiment with other spaCy commands.
# I will also use such code for future reference to spaCy. It will take time for me to get used to Python and spaCy.
for token in chatWords:
    print(token.text, ":", token.pos_, ". This word's root is", token.lemma_)

for ent in chatWords.ents:
    print(ent.text, ent.start_char, ent.end_char, ent.label_)

for token in chatWords:
    print(token.text, token.lemma_, token.pos_, token.tag_, token.dep_, token.shape_)