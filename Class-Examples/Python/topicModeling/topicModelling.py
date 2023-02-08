# ####################################################
# INTRODUCTION TO LDA TOPIC MODELING
# ebb: This introductory Python script is designed to read a collection of 209 text files
# each one holding a tale in the Grimm's Fairy Tales collection. We'll explore topic modeling
# the collection, to see if we can "distant read" topics based on clusters of frequently repeated words.
#######################################################
# PIP INSTALLS TO MAKE FOR NLTK LDA TOPIC MODELING
# In your Git Bash or Terminal, start with the following installs to your Python environment:
# pip install gensim
# pip install pyldavis
# pip install nltk
# pip install ipython
# ####################################################
import pandas as pd
import nltk
nltk.download('stopwords')
from nltk.corpus import stopwords
import string
import gensim.corpora as corpora
from gensim.models import LdaModel
import pyLDAvis.gensim_models
import os

# ############ STOP WORDS AND PUNCTUATION CUSTOMIZED HERE ###################
# First, we pull in the nltk library's standard stop word list for English.
stop_words = stopwords.words('english')
# print(stop_words)
print(f"{stop_words=}")
# ebb: Above line is an "f-string" or formatted print.
# This is a fancy way of saying print(stop_words) only tell me WHAT you're printing.
# When we do a lot of printing, it's helpful to have the information come out labeled.
# f"{var=}" gives you a special "formatted print" in the console
# and this formatting will let us tag the output as "stop words" since we
# print a lot of output there.
print(f"{string.punctuation=}")

# ADDING WORDS TO THE STOP WORD LIST
# ebb: You'll see some words that get repeated a lot, like "said" in your topic modeling
# output. Adding these to the stop word list may improve the topic model clustering.
# stop_words is just a list of words that we imported,
# so you can just append a new value to the list like this:
# stop_words = stop_words.append('said')
# You can extend it to add a list of new stopwords with:
# newStopWords = ["said", "one", "go", "went", "came"]
# stop_words.extend(newStopWords)
# print("UPDATED: " + f"{stop_words=}")
# REMEMBER TO CHANGE YOUR EXTENDED STOP WORD LIST FOR NEW COLLECTIONS!
# ##################################################################

# Set up to read our file directory ###
workingDir = os.getcwd()
print("current working directory: " + workingDir)
grimmTalesPath = os.path.join(workingDir, 'grimmTales')
print(grimmTalesPath)

# cleaning documents:
def clean_doc(doc):
    text = open(doc, encoding='utf-8').read()
    no_punct = ''
    for c in text:
        if c not in string.punctuation:
            no_punct = no_punct + c
    # with list comprehension
    # no_punct = ''.join([c for c in doc if c not in string.punctuation])

    words = no_punct.lower().split()

    final_words = []
    for word in words:
        if word not in stop_words:
            final_words.append(word)

    # with list comprehension
    # final_words = [word for word in words if word not in stop_words]
    return final_words

# ebb: This controls our file handling as a for loop over the directory:
allDocs = []
for file in os.listdir(grimmTalesPath):
    if file.endswith(".txt"):
        filepath = f"{grimmTalesPath}/{file}"
        # print(filepath)
        allDocs.append(filepath)
        # clean_doc(filepath)
# print(allDocs)

# PREPARING THE CORPUS FOR TOPIC MODELING ########################
cleaned_docs = [clean_doc(doc) for doc in allDocs]
id2word = corpora.Dictionary(cleaned_docs)

# print(id2word[260])
corpus = [id2word.doc2bow(cleaned_doc) for cleaned_doc in cleaned_docs]
# print(corpus)

# Show the words and numbers in just the first document:
# for num in corpus[0]:
#     num = num[0]
#     print(f"{num}\t{id2word[num]}")

# TOPIC MODELING with LDA ########################
lda_model = LdaModel(corpus=corpus, id2word=id2word, num_topics=20)
# Suggestion: Try 10 - 50 topics and vary in 5s
topics = lda_model.get_document_topics(corpus)
print(f"{len(topics)=}")
# ebb: len(topics) appears to be the number of documents. There are
# 209 documents in the Grimm collection.
print(f"{topics[208]=}")
# topics[208] represents the topics in document 209. Remember why?
# Notice our format string: called "f-printing":
# This comes out:
# topics[208]=[(20, 0.11845379), (66, 0.015097282), (74, 0.118847124), (76, 0.31761664), (82, 0.42932528)]
# Topics is a dictionary with the keys as the document numbers and values are the
# list of topics for that document. The values are tuples: (Topic number, weight of topic).
# HEY, don't we want to sort these by weight?
sorted_topics = sorted(topics[208], key=lambda x: x[1], reverse=True)
# This says, sort the topics, and the sort key is x, and then you'll get the second member
print(f"{sorted_topics=}")
# ebb: Notice, every time we run this, we get a different random assortment of topics present in the document we chose.
# Our returns here are a sign of the randomization built into LDA topic modeling!

# ebb: So, let's see what's in a topic:
for topic in topics[208][:10]:
    # This asks for up to 10 topics in document 209. It'll be fine if 10 topic clusters aren't really available there.
    terms = lda_model.get_topic_terms(topic[0], 20)
    # topic[0] is not the same as topics. (topics are documents). topic is an actual topic.
    # topic[0] is probably the heaviest weighted "top" topic.
    print(topic)
    for num in terms:
         num = num[0]
         print(num, id2word[num])
    print()

# Visualizing the models: not working
vis = pyLDAvis.gensim_models.prepare(lda_model, corpus, id2word, mds="mmds", R=30)
# vis = pyLDAvis.show(vis)
pyLDAvis.save_html(vis, 'topicModel_Visualization.html')




