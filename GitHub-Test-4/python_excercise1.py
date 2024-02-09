import spacy
nlp = spacy.load('en_core_web_sm')

zuckGPT = open('chatgpt_zuck.txt', 'r', encoding='utf8')
words = zuckGPT.read()
wordstrings = str(words)
print(wordstrings)

zuckWords = nlp(wordstrings)
for token in zuckWords:
    print(token.text, "---->", token.pos_, ":::::", token.lemma_)
