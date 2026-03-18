import nltk
import nltk.corpus
# The next line downloads all the example texts used in the NLTK book at https://www.nltk.org/book !
# nltk.download('book')
from nltk.book import text6
from urllib import request


# NEED THESE IMPORT LINES FOR HANDLING PLOTS
import matplotlib
import matplotlib.pyplot as plt
# import tk

# TEST IF GRAPHING WORKS:
# plt.plot(range(10))
# plt.show()

text6.dispersion_plot(['rabbit', 'grail', 'coconut', 'Arthur'])
plt.show()
