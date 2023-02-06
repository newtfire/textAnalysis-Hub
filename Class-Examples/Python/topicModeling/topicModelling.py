# In the shell start with the following installs:
# pip install gensim
# pip install pyldavis
# pip install nltk
# pip install ipython
import pandas as pd
import nltk
nltk.download('stopwords')
from nltk.corpus import stopwords
import string
import gensim.corpora as corpora
from gensim.models import LdaModel
import pyLDAvis.gensim_models
# pyLDAvis.enable_notebook()
from IPython.core.display import HTML
# For visualizations try https://stackoverflow.com/questions/43014259/display-formatter-attribute-error-in-python
# Simply doing visualisation = pyLDAvis.gensim.prepare(lda_model, corpus, dictionary), and then pyLDAvis.save_html(visualisation, 'LDA_Visualization.html') works!
# Other solutions:
# https://github.com/bmabey/pyLDAvis/issues/101#issuecomment-743067299
# pyLDAvis.show() works fine for me.
# lda_display = pyLDAvis.gensim.prepare(ldamodel, corpus, dictionary, sort_topics=False)
# pyLDAvis.show(lda_display)
import os

stop_words = stopwords.words('english')
print(stop_words)
print(string.punctuation)

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

cleaned_docs = [clean_doc(doc) for doc in allDocs]
id2word = corpora.Dictionary(cleaned_docs)

# print(id2word[250])
corpus = [id2word.doc2bow(cleaned_doc) for cleaned_doc in cleaned_docs]
# print(corpus)

# Show the words and numbers in just the first document:
# for num in corpus[0]:
#     num = num[0]
#     print(f"{num}\t{id2word[num]}")

# TOPIC MODELING with LDA

lda_model = LdaModel(corpus=corpus, id2word=id2word, num_topics=500)
topics = lda_model.get_document_topics(corpus)
print(len(topics))

for topic in topics[2][:3]:
    terms = lda_model.get_topic_terms(topic[0], 20)
    print(topic)
    for num in terms:
         num = num[0]
         print(num, id2word[num])
    print()

# Visualizing the models: not working
vis = pyLDAvis.gensim_models.prepare(lda_model, corpus, id2word, mds="mmds", R=30)
# vis = pyLDAvis.show(vis)
pyLDAvis.save_html(vis, 'topicModel_Visualization.html')









