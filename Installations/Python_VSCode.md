# Python 3.12 + VS Code
Updated for Spring 2026

---

## 1. Python 3.12

For working with Natural Language Processing libraries in Spring 2026, we will use **64-bit Python 3.12**. Here's why:

- Python 3.12 is stable, well-tested, and fully supported by every library we use in this course.
- We're staying away from Python 3.14, which is the current "bleeding edge": third-party libraries are still catching up and sometimmes the latest versions break when we try something!
- Python 3.13 is also a valid choice today (libraries like NLTK and spaCy now support it), but 3.12 remains the safest bet for maximum compatibility across everything we'll use, including the SaxonC/saxonche library for our XML work.

> **Note:** You'll be doing your Python installations using the command line with Chocolatey (Windows) or Homebrew (Mac), rather than GUI installers.

### Windows Users

- First, install the Windows package manager **Chocolatey**. (You already did this for the ixml/XProc in February — but [the instructions are kept here for reference](../Installations/ixml-xproc-InstallNotes-Win.md#windows-specifics).) Open **Windows PowerShell as Administrator** and follow Chocolatey's install instructions, copying and pasting each command in sequence.
- Run the following `choco` command in PowerShell to install Python 3.12:
  ```
  choco install python --version=3.12.0
  ```
- Verify that Python is installed by exiting your shell, re-opening it, and typing `python`. You should see Python open its own command prompt and identify itself as `Python 3.12`. If not, you're not done yet!
- **You must add Python 3 to your PATH variable!** Follow [these instructions](https://www.geeksforgeeks.org/how-to-add-python-to-windows-path/) to add your newly installed Python to your PATH. (This means you can easily work with Python in your code editor and don't have to hunt for where it's installed every time you need to use it.)
- In case needed, here's a lot of detailed documentation from Python.org for Windows: <https://docs.python.org/3/using/windows.html>

### Mac Users

- We'll use Homebrew (which you already set up in February). If you ever need to reinstall Homebrew, start here: https://brew.sh
- Install Python 3.12 by running:
  ```
  brew install python@3.12
  ```
- Verify with:
  ```
  python3.12 --version
  ```

> **Note:** Older MacBook Pro users (back to 2017): your machine is fully supported! Homebrew installations may take longer than on newer hardware. Just be patient and let it take it's time installing. If you run into trouble, let Dr. B or coding mentors know.

### Linux Users

Using Linux? Let Dr. B know and we'll get you sorted. Most Linux distributions can install Python 3.12 via their package manager (e.g., `sudo apt install python3.12` on Ubuntu/Debian).

### Smoke Tests (Everyone)

**Python:**

- Open a shell anywhere on your computer and enter `python` or `python3.12`. This should display the version. On Mac, you can also run `which python3.12`.
- Have multiple Python versions installed? (Dr. B has three!) You can specify the version explicitly:
  - `which python3.12` (Mac/Linux)
  - `where python3.12` (Windows)
- When installing libraries with pip, always specify your version like this:
  ```
  python3.12 -m pip install <library-name>
  ```
- To exit the Python prompt and return to your regular shell, type `exit()`.

**pip Package Manager:**

- pip should be installed automatically with Python. Verify with `which pip` (Mac/Linux) or `where pip` (Windows).
- If pip is missing or hard to find, see the [RealPython pip tutorial](https://realpython.com/what-is-pip/) for help.

---

## 2. VS Code (Visual Studio Code)

We're using **VS Code** for Python this semester. It's free, lightweight, works great on all operating systems (including older machines!), and has excellent Python support.

### Install VS Code

- Download and install VS Code from: <https://code.visualstudio.com>
- Choose the installer for your operating system (Windows, Mac, or Linux).
- Mac users: drag VS Code into your Applications folder when prompted.

### Install the Python Extensions

VS Code's Python support comes from extensions. You need two:

- **Python** (by Microsoft):  the core extension for running Python, selecting your interpreter, and basic IntelliSense.
- **Pylance** (by Microsoft) : adds more helpful syntax checking. It's usually installed automatically alongside the Python extension.

To install:

1. Open VS Code.
2. Click the Extensions icon in the left sidebar (it looks like four squares), or press `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (Mac).
3. Search for **Python** and install the one by Microsoft.
4. Pylance should install automatically. If not, search for it and install it too.

### Point VS Code at Python 3.12

Once the Python extension is installed, you need to tell VS Code which Python to use:

1. Open the Command Palette: `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac).
2. Type **Python: Select Interpreter** and press Enter.
3. Choose **Python 3.12** from the list. If you don't see it, click "Enter interpreter path" and browse to your Python 3.12 installation.

> **Note:** You may need to re-select your interpreter when you open a new project folder. VS Code stores this setting per project.

---

## 3. Virtual Environments

A **virtual environment** is an isolated Python workspace for a specific project. It keeps that project's library installations separate from the rest of your system, so installing NLTK or spaCy for your project / homework doesn't interfere with other Python projects you might have. 

### Create a Virtual Environment

Do this once per project (e.g., once for this class). (You could set up your Python project environment on your GitHub folder, or make a special one for homework vs. for a shared project. You can also reconfigure this later if you need to.)

1. Open your project folder in VS Code (`File > Open Folder`).
2. Open the integrated terminal: `` Ctrl+` `` (Windows/Linux) or `` Cmd+` `` (Mac). This opens a terminal right inside VS Code.
3. Run the following command to create a virtual environment called `.venv`:
   ```
   python3.12 -m venv .venv
   ```
4. VS Code will likely detect the new environment automatically and ask: "Do you want to select the new virtual environment?" — click **Yes**.

### Activate the Virtual Environment

You'll need to activate the environment each time you open a new terminal session:
NOTE your shell and which direction filepath separators need to go: forward or back! 

- **Mac/Linux:** `source .venv/bin/activate`
- **Windows (in Windows shell):** `.venv\Scripts\Activate` 
    - In Windows Git Bash you may be able to type: `.venv/Scripts/Activate` (try the tab to autocomplete and see how it works.)

When active, you'll see `(.venv)` at the start of your terminal prompt. That means you're in!

> **Note:** VS Code will often activate your virtual environment automatically when you open a new terminal inside a project that already has one. Check for `(.venv)` in your prompt to confirm.

### Install Libraries Inside Your Environment

Once your virtual environment is active, you can install libraries with pip, the python package manager: 

```
pip install nltk
pip install spacy
pip install saxonche
```

Because you're inside a virtual environment, you don't need to specify `python3.12 -m pip` — the environment already knows which Python to use.

### Deactivate When Done

To exit your virtual environment and return to your regular system Python, just type:

```
deactivate
```

### Smoke Test: Virtual Environment

- **Activate** your virtual environment (see above):  when active you'll see `(.venv)` in your command prompt.
- Run `pip list` — you should see only the libraries you've installed for this project, not your entire system's Python packages.
- Run `python --version` — it should report Python 3.12.
- Try importing a library: open a Python prompt with `python` and type `import nltk`. No errors means you're good!

---

## Troubleshooting Tips

- **VS Code doesn't see my interpreter:** Try reopening the folder, or use the Command Palette → Python: Select Interpreter to re-select manually.
- **My virtual environment isn't activating on Windows:** You may need to allow script execution first. Run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
- **pip installs the library but Python can't find it:** You're probably not inside your virtual environment. Check for `(.venv)` in your terminal prompt and activate if needed.
- **Not sure which Python your terminal is using:** Run `which python` (Mac/Linux) or `where python` (Windows).

As always, if you get stuck, reach out on Digit Discord! Environment setup issues are some of the most common (and fixable) problems and we can help each other by comparing notes!
