# Python Orientation for Natural Language Processing (NLP)

*Note: this exercise is designed for VS Code which we're using in the Spring 2026 Digit 210 class. If you're working with Pycharm from learning this in previous years, here's a link to [the "legacy version" with extra Pycharm setup instructions](python-nlp-pycharm-orientation-exercise.md).*

The Python programming language is among the most popular ways to access packages or libraries for **Natural Language Processing** (NLP). In our class we are applying Python together with the XML stack to do some powerful and precise text analysis. In our introduction to Python with NLP, we'll explore "to see what we can see" and experiment with your project texts. The Python programming language lets us work with NLP libraries, like NLTK and spaCy, to assist with retrieving meaningful units of language, like sentences, words, word-stems, punctuation, and other patterns (such as those you could define with regular expressions).

NLP libraries represent the cumulative work of decades of **computational linguistics**, a field that applies statistics to predict the most likely parts of speech of particular words, draws on information to identify the base word forms (or lemmas) of words in a document, and identifies patterned language like proper names in text documents and collections. NLP libraries and methods are also the groundwork for today's "AI" generative language models.

## Stage 1: Prepare a special directory on your personal GitHub repo and some text files to experiment with

* First, make sure you have our .gitignore file to screen out Python virtual environment files and libraries. Get a copy of [the .gitignore file from the textAnalysis-Hub or your Project repo](https://github.com/newtfire/textAnalysis-Hub/blob/main/.gitignore), and save it at the top level of your repo, and then use your git commands to add, commit, and push it.
     * NOTE: This is a system "dot-file" that starts with a dot: `.gitignore`. Setting your `.gitignore` in place is important because it screens out local installation and system files specific to your computer — this allows you to share Python projects with peers and your prof working on different computers and platforms.
* Now, create a directory in your personal GitHub repo for Python project work with natural language processing. (You could name the directory `python-nlp` or something simple and clear for you.)
* In it, save some "plain" text files saved with the `.txt` extension. If you need some text files to start with, copy some over from our [Class Examples/Python folder](https://github.com/newtfire/textAnalysis-Hub/tree/main/Class-Examples/Python) on the textAnalysis-Hub.

## Stage 2: Set up your workspace in VS Code, Open your new Python directory in VS Code, and Start a Virtual Environment (venv)

Take a moment to set up VS Code's interface and choose a good theme for your eyes. Here's [some advice on "The Ulitmate VS Code Setup for Python"](https://medium.com/ordinaryindustries/the-ultimate-vs-code-setup-for-python-538026b34d94) which leads you to a preview of all the themes.

If you've worked through the [Python + VS Code installation guide](https://github.com/newtfire/textAnalysis-Hub/blob/main/Installations/Python_VSCode.md), you already know how virtual environments work. Here's how to apply that to this assignment.

**Already have a .venv set up on a parent folder?** That's fine! Just** activate** it and skip the creation step below. It's perfectly okay to have virtual environments at different levels on your computer; they don't interfere with each other. Just make sure VS Code is pointing at the right one for this project (Command Palette → Python: Select Interpreter).

**If you need to create a .venv**:

* In VS Code, go to **File > Open Folder** and navigate to the `python-nlp` directory you just created inside your GitHub repo. Open it.
* Open the integrated terminal inside VS Code: `` Ctrl+` `` (Windows/Linux) or `` Cmd+` `` (Mac).
* Create a virtual environment for this project:

```
python3.12 -m venv .venv
```

* VS Code will detect the new `.venv` and ask: *"Do you want to select the new virtual environment?"* — click **Yes**. (If it doesn't ask, use the Command Palette: `Ctrl+Shift+P` / `Cmd+Shift+P` → **Python: Select Interpreter** and choose the `.venv` option.)

* Activate your virtual environment:
  * **Mac/Linux:** `source .venv/bin/activate`
  * **Windows (PowerShell):** `.venv\Scripts\Activate.ps1`
  * **Windows (Git Bash):** `source .venv/Scripts/activate`

* When active, you'll see `(.venv)` at the start of your terminal prompt. You're in!

> **Note:** The `.gitignore` file you added in Stage 1 already tells git to ignore `.venv/`, so your virtual environment files won't get pushed to GitHub. This is exactly what you want — your teammates run `pip install` on their own machines, rather than syncing a huge environment folder.

### Install NLTK inside your virtual environment

With your virtual environment active, install NLTK using pip:

```
pip install nltk
```

Since this is (very likely) the first time you've worked with NLTK, you also need to download its data resources. Open a Python prompt (just type `python` in your terminal) and run:

```python
import nltk
nltk.download('book')
```

This downloads the sample texts and corpora used in the NLTK Book. It may take a few minutes! When it's done, type `exit()` to return to your regular terminal.

> **Tip:** If `nltk.download('book')` feels like too much to download at once, you can also run `nltk.download()` to open an interactive chooser. For getting started, the `book` package has everything we need.

[Resource to consult in case of issues with virtual environments or pip](https://docs.python-guide.org/dev/virtualenvs/).

## Stage 3: "Smoke Test" and Learn: Write some Python code with NLTK

* Start with the NLTK Book's very first chapter as a "smoke test" and to get you started with your first Python program. Read [the NLTK Book Preface](https://www.nltk.org/book/ch00.html) up to the "Python 3 and NLTK" heading.

* In VS Code, create a new Python file in your `python-nlp` directory: **File > New File**, save it with a `.py` extension (e.g., `nlp-orientation.py`).

* Our [Python sample files](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/Python/) are stored on the textAnalysis-Hub in Class Examples > Python.
  * The best way to work with these: **read them in the web browser and write your own adapted version** in your new Python file. This way the code is yours and you understand what each line does.

* Try adapting the code from the "Why Python" section of the NLTK Book Preface to work with one of the `.txt` files you saved in your directory. See if it runs! Even if it doesn't work perfectly, save your file and push to GitHub — that's your submission for this first assignment.

### Running your script in VS Code

To run your Python file:
* Make sure your `.venv` is active in the terminal (check for `(.venv)` in the prompt).
* Either click the **Run** button (triangle icon) in the top right of the editor, or run it from the terminal:

```
python nlp-orientation.py
```

Output will appear in the integrated terminal below.

## What to submit

Push your work to your personal GitHub repo (and make sure it's easy for me to find your Python directory there). Your repo should contain:

* The `.gitignore` file at the root
* Your `python-nlp/` directory with:
  * Your `.txt` text file(s)
  * Your `.py` Python script
  
NOTE: Your repo should **not** contain the `.venv/` folder: that should now properly be ignored by git! 

**On Canvas:** Post a link to your repo (with its clearly named directory for your Python work) to the submission point on Canvas.

As always, if you get stuck, reach out on Digit Discord! We can help each other by comparing notes!