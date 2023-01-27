# 2022-04-20 ebb: This builds on avatarCounter.py to plot a stylized SVG using the Pygal library
# Pygal documentation: https://www.pygal.org/en/stable/documentation/index.html
# Lots of examples for styling/colors/customizing wtih your own CSS:
# https://www.pygal.org/en/stable/documentation/styles.html
# In your SHELL (Git Bash or Terminal), install Pygal with: pip install pygal
import spacy
from collections import Counter
import pygal
# choose a style you like:
from pygal.style import LightenStyle
dark_lighten_style = LightenStyle('#873429', step=10)
from pygal.style import DarkGreenBlueStyle
# Next line is only necessary the very first time you run nlp. Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')

avatarSpeeches = open('avatarSpeeches.txt', 'r', encoding='utf8')
words = avatarSpeeches.read()
avatarNLP = nlp(words)


def verbCollector(words):
    VerbLemmas = []
    for token in words:
        if token.pos_ == "VERB":
            print(str(token.lemma) + ' : ' + str(token.lemma_))
            VerbLemmas.append(token.lemma_)
    # Now use the amazing python Counter() to take distinct values and
    # count how often each distinct lemma is used in the collection,
    # and sort from most to least frequent!
    # Counter() makes a "tuple" data structure (two parts separated by a colon):
    # {term: count, term: count, term: count }
    LemmasCounted = Counter(VerbLemmas)
    print(LemmasCounted)
    # most_common() function takes distinct values and counts and sorts from most to least

    return LemmasCounted

            # print(token.text, "---->", token.pos_, ":::::", token.lemma_)

avatarVerbs = verbCollector(avatarNLP)
lemmacount = len(avatarVerbs)
print('There are ' + str(lemmacount) + ' distinct lemma verb forms in the Avatar series.')
top20 = avatarVerbs.most_common(20)
print(top20)

bar_chartAvatarVerbs = pygal.Bar(background="transparent", plot_background='transparent', style=dark_lighten_style)
# Styling from https://www.pygal.org/en/stable/documentation/parametric_styles.html
bar_chartDarkBlueGreen = pygal.Bar(style=DarkGreenBlueStyle)

bar_chartAvatarVerbs.title = 'Top 20 Verbs in the Avatar Series'
bar_chartDarkBlueGreen.title ='Top 20 Verbs in the Avatar Series: Dark Mode'

for t in top20:
    # this is a list of tuples with word and number, so we return its values like this:
    print(t[0], t[1])
    bar_chartAvatarVerbs.add(t[0], t[1])
    bar_chartDarkBlueGreen.add(t[0], t[1])

# Output the SVG as a new file: https://www.pygal.org/en/stable/documentation/output.html
bar_chartAvatarVerbs.render_to_file('AvatarTopVerbs.svg')
bar_chartDarkBlueGreen.render_to_file('AvatarTopVerbsDark.svg')


