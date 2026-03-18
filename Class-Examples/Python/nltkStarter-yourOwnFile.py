# This Python file is here to help you get started applying NLTK to your own text files. 
# So it's going to read in a file from your own directwory and tokenize it so NLTK can analyze it. 
import nltk
import matplotlib
import matplotlib.pyplot as plt
# Here we're going to open a file stored in the same folder with this Python script. 
# We'll open it in a block: and everything that happens inside the block stays in the block: 
# The file is ONLY open inside this block, so we'll write all the NLP processing of it inside, indented within it:
with open("avatarSpeeches.txt", 'r', encoding='utf-8') as file:
    text=file.read() #ebb: This unpacks the text from the file
    textTokens=text.split() #ebb: This will chop up the text on its spaces and around punctuation marks and give you a list of them.
    # Uncomment the line below to see a sorted set of unique words in your text:

    # print(sorted(set((textTokens)))[:20])
    # Here's a little "list comprehension" to lowercase each token in the list: you may or may not want to use these! 
    lowerCaseTokens = [w.lower() for w in textTokens]
    # What if you change this to upper()? 
    print(set(lowerCaseTokens))

    # You've created a list of tokens with textTokens
    # Now, we have to turn these tokens into an NLTK Text Object for the NLTK library to work with:
    avatarTextObject = nltk.Text(lowerCaseTokens)
    # This nifty syntax is called an "f-string" and it lets you label the thing you're outputting so you know what it is:
    print(f"Avatar as NLTK Text Object = {avatarTextObject}")
    # So you have a Text Object which puts your list of tokens in a fancy wrapper for NLTK to work with. (You can treat this file just like one of the NLTK book donwloads now.)
    # Try NLTK stuff now, like making a concordance or a disperson plot. 
    avatarTextObject.dispersion_plot(["avatar", "know", "run", "ran", "fly", "flying", "flew"])
    plt.show()
    # Lots of tokens have punctuation and lots of word forms. Stemming would help find and track the root words. Read more about it in the NLTK book.





