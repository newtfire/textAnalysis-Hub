textfile = open('eeb-chatgpt-results.txt', 'r', encoding='utf8')
words = textfile.read()
wordstrings = str(words)
print(wordstrings)
chat = "Ai prompt"
gpt = 'responses'
chat_gpt = chat + ' ' + gpt
print(chat_gpt)