# ##### TOP2VEC experiment with Grimm Fairy Tales collection ######
# Discovered we can't fully pip install top2vec with Python version 3.11
# due to a dependency problem on numba https://stackoverflow.com/questions/75045575/unable-to-install-top2vec
# numba just won't work on 3.11 and they haven't resolved the problem yet
# So we need to run on a lower version. I have 3.9 installed so I'm proceeding with that
# as my configuration.
from top2vec import Top2Vec
import os
import sklearn.datasets
import pandas as pd
import numpy as np
import umap
# For visualization see https://docs.bokeh.org/en/latest/docs/user_guide/export.html
# Also see for vis from Top2Vec: https://github.com/ddangelov/Top2Vec/issues/133
import umap.plot
from bokeh.io import export_png
from bokeh.io import export_svg
import matplotlib.pyplot as plt

# Set up to read our file directory ###
workingDir = os.getcwd()
print("current working directory: " + workingDir)
grimmTalesPath = os.path.join(workingDir, 'grimmTales')
print(grimmTalesPath)

allDocs = []
for file in os.listdir(grimmTalesPath):
    if file.endswith(".txt"):
        filepath = f"{grimmTalesPath}/{file}"
        # print(filepath)
        text = open(filepath, encoding='utf-8').read()
        allDocs.append(text)

# ebb: Apparently the Grimm Tales collection wasn't long enough and Top2Vec needed more words
# so it output an error. Following Stack OVerflow advice, I tried the following code to split up the tales into more smaller documents.
# See https://stackoverflow.com/questions/65785949/valueerror-need-at-least-one-array-to-concatenate-in-top2vec-error
# allDocs_split = []
# for doc in allDocs:
#     skip_n = 5000
#     for i in range(0,130000,skip_n):
#         allDocs_split.append(doc[i:i+skip_n])

model = Top2Vec(allDocs)
print(model)

topic_sizes, topic_nums = model.get_topic_sizes()

for topic_size, topic_num in zip(topic_sizes[:5], topic_nums[:5]):
    print(f"Topic Num {topic_num} has {topic_size} documents.")

topic_words, word_scores, topics = model.get_topics(2)

for words, scores, num in zip(topic_words[0:], word_scores[0:], topics[0:]):
    print(f"Topic {num}")
    for word, score in zip(words, scores):
        print(word, score)

model_ngram = Top2Vec(allDocs, ngram_vocab=True)

topic_sizes_ngram, topic_nums_ngram = model_ngram.get_topic_sizes()

topic_words_ngram, word_scores_ngram, topics_ngram = model_ngram.get_topics(2)
for words, scores, num in zip(topic_words_ngram[0:], word_scores_ngram[0:], topics_ngram[0:]):
    print(f"Topic {num}")
    for word, score in zip(words, scores):
        print(word, score)

# model.generate_topic_wordcloud(0)

vectors = model_ngram._get_document_vectors()
reduced2d = umap.UMAP(n_neighbors=15, n_components=2, metric='cosine', verbose=True).fit_transform(vectors)

x, y = reduced2d[:,0], reduced2d[:,1]
plt.scatter(x,y)


image_name = 'top2vecVis.png'
# ebb: This is NOT WORKING to create and asve an output image
plt.show()
plt.savefig(image_name)
