# Installing Homebrew and OpenJDK (Macs)

## Install Homebrew!
<img src="homebrew.png" alt="homebrew logo" width="500"/>

Homebrew is a package manager that helps you install things on your Mac quickly in your Terminal. 
We'll use it for installing OpenJDK Java.

1. Open a new terminal on your computer.
2. Then in a web browser look up this url : <https://brew.sh>

3. Once you have Homebrew website open you should see a big header that says install homebrew and a line of terminal code below it:
```shell 
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```  

You will need to copy the code into your terminal and enter. This starts the installation process.
(You'll be prompted maybe a few times to accept "Y" or "N" questions. Just click "Y" to continue installing.)

4. You will receive an error for sudo which represents "substitute user do" so to counter this error you will take the download code line for homebrew and add the word sudo before `sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` after running this line it will prompt you with asking for a password this is the password you use to login to you local computer.
5. Once you enter your password the terminal will the state "Checking for sudo access (which may request your password)... Don't run this as root!" aftering receiving this error you will then repaste that orginal homebrew install code.
6. After entering the original install code line the terminal will say "Checking for sudo access (which may request your password)... This script will install:" you may get asked you type in your computers password again but you will most likely not though if you do get asked for password just repeat past notes.
7. Once you get that installing note that the script will download your terminal will then run a bunch of code lines. **After that process completes, at the end of all those run lines the terminal should say something like this**:

```shell
 Next steps: Run these commands in your terminal to add Homebrew to your PATH: echo >> /Users/dannikalove/.zprofile echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/dannikalove/.zprofileeval "$(/opt/homebrew/bin/brew shellenv)" Run brew help to get started Further documentation: https://docs.brew.sh"
```


8. You will now need to be VERY careful when running each one of those commands. **HEADS UP! You must do two things: Replace the [square-bracketed] portions of each command with your specific filepath to your "home" and system dot-files. Run each line separately.** We're using Dannika's profile as an example here!

    * First, **edit** and run this command : `echo >> [/Users/dannikalove]/.zprofile` 
    * Next, **edit** run this line : `echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> [/Users/dannikalove]/.zprofile` 
    * Lastly, run this line : `eval "$(/opt/homebrew/bin/brew shellenv)"`


## Install OpenJDK Java!

1. To install the OpenJDK Java on your computer, you must have Homebrew installed first (see above). Install the current stable OpenJDK java with : `brew install openjdk`
2. After the Homebrew installation completes, close and reopen your terminal, and check if Java is installed with this line: `java -version` 
(You can also check `which java` and `where java`). Each of these commands will show you that OpenJDK java is installed. 



