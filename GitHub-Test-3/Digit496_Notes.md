# Digit 496 Notes:


## Installing homebrew :


1. Installing homebrew is for downloading java on your personal computer.
2. When needing to get homebrew you will open a new terminal on your computer then in a web browser look up this url : `https://brew.sh`
3. Once you have homebrew website open you should see a big header that says install homebrew and a line of terminal code below it `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`. You will need to copy the code into your terminal and this will start your launch process.
4. You will receive an error for sudo which represents "substitute user do" so to counter this error you will take the download code line for homebrew and add the word sudo before `sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` after running this line it will prompt you with asking for a password this is the password you use to login to you local computer.
5. Once you enter your password the terminal will the state "Checking for sudo access (which may request your password)... Don't run this as root!" aftering receiving this error you will then repaste that orginal homebrew install code.
6. After entering the original install code line the terminal will say "Checking for sudo access (which may request your password)... This script will install:" you may get asked you type in your computers password again but you will most likely not though if you do get asked for password just repeat past notes.
7. Once you get that installing note that the script will download your terminal will then run a bunch of code lines at the end of all those run lines the terminal will say `Next steps: Run these commands in your terminal to add Homebrew to your PATH: echo >> /Users/dannikalove/.zprofile echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/dannikalove/.zprofileeval "$(/opt/homebrew/bin/brew shellenv)" Run brew help to get started Further documentation: https://docs.brew.sh"`
8. You will need to be careful when running each one of those commands. You must run each line separately, 
* first run this command : `echo >> /Users/dannikalove/.zprofile` 
* next run this line : `echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/dannikalove/.zprofile` 
* lastly run this line : `eval "$(/opt/homebrew/bin/brew shellenv)"`


## Installing Java
1. To install java on your computer you must have homebrew installed first but if that is done you will type this command in the terminal to start the install process of java : `brew install openjdk`


## Setting up an alias
### Getting to zshell

1. `cd` 
1. `ls - lisa`
1. `nano .zshrc`

### Making alias

1. Example : `export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
alias github="cd /Users/dannikalove/Documents/Github"`

### Getting out of zshell 

1. 1. type : control X
1. 1. type : shift Y
1. 1. type : return/enter


## Installing Bat
1. Make sure to `cd` your terminal first
1. Type `brew install bat`
1. After installing at the ending of the install it will say where it was installed to. With collaboration from other testers we have found that bat will install to different location mine was `zsh completions have been installed to:  /opt/homebrew/share/zsh/site-functions` 


## Installing coffeepot

When downloading coffeepot for mac users your computer will give you a malware error (it is not malware mac is just super careful) that you will need to bypass to continue the install process.
1. Go to your little apple icon in top left
1. Hit system settings
1. Then go to your privacy and security page
1. Once there scroll down to the bottom to the security section which will say something only the lines of "'coffeepot' was blocked to protect your mac" then have a 'allow anyway' or 'open anyway' button you will need to click. 

These steps will allow you to continue the install process.