import spacy
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')

bing = open('bing.txt', 'r', encoding='utf8')
words = bing.read()
wordstrings = str(words)
print(wordstrings)

bingWords = nlp(wordstrings)
for token in bingWords:
    # if token.pos_ == "VERB":
    print(token.text, "---->", token.pos_, ":::::", token.lemma_)

claude = open('claude.txt', 'r', encoding='utf8')
words = claude.read()
wordstrings = str(words)
print(wordstrings)

claudeWords = nlp(wordstrings)
for token in claudeWords:
    if token.pos_ == "VERB":
        print(token.text, '---->', token.pos_, ':::::', token.lemma_)

chatGPT = open('chatGPT.txt', 'r', encoding='utf8')
words = chatGPT.read()
wordstrings = str(words)
print(wordstrings)

chatGPTWords = nlp(wordstrings)
for token in chatGPTWords:
    if token.pos_ == "VERB":
        print(token.text, '---->', token.pos_, ':::::', token.lemma_)
print("---------------------------------------------------------------")

print("Glover" in words)
# Why is this giving me a boolean? Ohp, nevermind, I looked into it and it is supposed to be a boolean
# I wonder if you can get it to open a file and have it show how many times a word shows up
# Oh! I fixed it to read the file so now it says the Glover is in the txt file :)

name = input("What is your name? ")
print("Hello " + name)

birth_year = input("Enter your birth year: ")
age = 2024 - int(birth_year)
print(age)

float()

# Unrelated code to the texts, but I thought it was neat :)
# I wonder how to get it to get the amount of days someone has been alive

