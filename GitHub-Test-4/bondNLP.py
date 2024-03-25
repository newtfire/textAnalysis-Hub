# Source(s):
# CNBC, Yahoo
# 
# Objective:
# Webscrape the top headlines from each source. Perform a sentiment analysis on them. Aggregate the results and log into json.

# Imports
import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from nltk.stem import WordNetLemmatizer
from nltk.sentiment import SentimentIntensityAnalyzer

import requests

from bs4 import BeautifulSoup

import json

# NLTK Downloads
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')
nltk.download('vader_lexicon')

## CNBC ##

# print("\n\nLet's look at CNBC. . .\n\n")
# Get URL
url = 'https://www.cnbc.com/'
response = requests.get(url)
html_content = response.text

# Set up BeutifulSoup
soup = BeautifulSoup(html_content, 'html.parser')

# Find the headline article
headline_link = soup.find('h2', class_='FeaturedCard-packagedCardTitle').find('a').text
# print("The top article is " + headline_link + "\nLet's read this article. . . \n\n")

CNBC_article_text = headline_link

# Go to headline article
# url = headline_link
# response = requests.get(url)
# html_content = response.text

# # Set up BeutifulSoup
# soup = BeautifulSoup(html_content, 'html.parser')

# # Find body element
# try:
#     headline_body = soup.find('div', class_='ArticleBody-articleBody').find_all('p')
# except:
#     headline_body = soup.find('div', class_='FeaturedContent-articleBody').find_all('p')

# CNBC_article_text = ""
# for p in headline_body:
#     CNBC_article_text += p.text
####

## Yahoo Finance ##

# print("\n\nLet's look at Yahoo Finance. . .\n\n")
# Get URL
url = 'https://finance.yahoo.com/'
response = requests.get(url)
html_content = response.text

# Set up BeutifulSoup
soup = BeautifulSoup(html_content, 'html.parser')

# Find the headline article
headline_link = soup.find(class_="js-content-viewer").find(class_="W(100%)")['alt']
# print("The top article is " + headline_link + "\nLet's read this article. . . \n\n")

yahoo_article_text = headline_link

# Go to headline article
# url = headline_link
# response = requests.get(url)
# html_content = response.text

# # Set up BeutifulSoup
# soup = BeautifulSoup(html_content, 'html.parser')

# # Find body element
# headline_body = soup.find('div', class_='caas-body').find_all('p')

# yahoo_article_text = ""
# for p in headline_body:
#     yahoo_article_text += p.text
####






# Example financial article
print("Here are the two headlines: \n")
headlines = ""
headlines += CNBC_article_text + "\n"
headlines += yahoo_article_text
print(headlines)

# Tokenize the article
tokens = word_tokenize(headlines)

# Remove stopwords
stop_words = set(stopwords.words('english'))
filtered_tokens = [word for word in tokens if word.lower() not in stop_words]

# Optional: Lemmatize tokens
lemmatizer = WordNetLemmatizer()
lemmatized_tokens = [lemmatizer.lemmatize(token) for token in filtered_tokens]

# print(lemmatized_tokens)

sia = SentimentIntensityAnalyzer()
sentiment_score = sia.polarity_scores(' '.join(lemmatized_tokens))

positive = sentiment_score['pos'] * 100
negative = sentiment_score['neg'] * 100


# sentiment_quotient = positive / negative

print("\n----Analysis----\n")
print("Sources: CNBC, Yahoo Finance")
print(sentiment_score)
# print("Sentiment Quotient: " + str(sentiment_quotient))
print("\n------------------------\n")

# Load the existing data
with open('results.json', 'r') as file:
    data = json.load(file)

master_key = "data"

data[master_key][headlines] = sentiment_score

with open('results.json', 'w') as file:
    json.dump(data, file, indent=4)

print("Results logged in results.json")
