# Installing and working with eXist-dB on your local computer

eXist-dB is free and open source software, and you can download, install, and work with eXist-dB on your local computer, without needing a network connection. This will require you to interface with eXist in a web browser as it is being served from a local port `:8080` on your computer. You would upload directories of files into the database using the web browser interface (via any web browser on your computer).  

Here are [eXist-dB's official installation instructions](https://exist-db.org/exist/apps/doc/basic-installation), which indicate basic system requirements for your computer. As indicated by the eXist developers, you will need:
* At least Java version 8 
    * (Check this by opening your git Bash client (on Windows) or your Terminal (on Mac) and entering: `java -version`
    * You should return something that looks like this or higher: `java version "1.8.0_60"`
    * If you don't have Java or the appropriate Java, we recommend [Oracle's guidance and installation scripts](https://www.java.com/en/download/help/index_installing.html).
* About 200 Mb of disk space
* At least 512 Mb of available memory

Here are our instructions, as of 2021-03-27 (reviewed 2023-03-17), for installing and working with eXist-dB locally. 

* To install eXist-dB, start on their [Download page](http://exist-db.org/exist/apps/homepage/index.html), and click the button for the Latest Stable Release.
* On the new page that opens, scroll down to the section titled Downloads. This links four different kinds of download files, for different kinds of computers and installation environments (ranging from Linux, to Mac, to Windows).  
* Now, follow instructions below for your computer:

## Installation

### Mac
1. For Mac users, download the exist distribution with this file extension: **.dmg**. (Today that distribution is named `eXist-db-5.2.0.dmg`. In your finder, click on the `.dmg` installation file and open it, and you should be prompted to send it to your Applications. 
1. Open eXist-dB from your Applications. As you are prompted for set up, follow instructions as needed in the section below. 

### Windows
1. For Windows users, download the exist distribution marked **.jar** at the end .  (Today that distribution is named `	
exist-installer-5.2.0.jar`.)
1.  Double-click the `.jar` file you downloaded.  This opens the eXistdb Installer. Click the green Next button, and then use the Browse button to select an installation path where you want this to be installed. eXist will warn you if you are installing it in a directory with other files, so you may want to create a new directory for this. (For example, I am installing in the default location at `C:\eXist-db\data`).
1. eXist will ask you where to store its data directory. This is where your database files will be stored. We recommend accepting the destination that eXist-dB suggests (inside the directory you selected for installation). 

## Setup
1. eXist will prompt you to enter an admin Password. You don't have to do this (you can leave this blank), but you may want to if you're worried about security, for example if you are installing on a laptop you often use in public places like a coffee shop. Here's what the eXist developers say:

```
The Admin Password is a password for the eXist-db administrator account, or more commonly, the "admin" account. 
This admin account belongs to you, and certain key functions in eXist-db can only be performed by the admin. 
While you can leave the admin password blank, we strongly recommend setting the password in order to secure access your installation of eXist-db. 
Why? Keep in mind that while eXist-db is running, it can be accessed by other users on your local network (be it in your home or office, or at a cafe or on a train). 
So, securing your administrator's account on eXist-db is a good way to protect your data and prevent others from abusing the account.

```

1. Next you'll be prompted to select packages to install. You'll see them listed by name and size. You have to install anything that's greyed out because eXist requires this to run.  We recommend unless you're super strapped for space to just install all the apps there. 

1. Click next, and  the packages should install. 
1. When packages finish installing, click Next, and you'll see a Processing screen which should complete some tasks:  This screen looks like:
```
eXist version 5.2.0 (c58d04ec45de50e7738489dee072fcc863dc8b1b), Copyright (C) 2001-2021 The eXist-db Project
eXist-db comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it
under certain conditions; for details read the license file.

Connecting to database...
Using config: C:\eXist-db\etc\conf.xml
Connected :-)
Changed admin password OK!
shutting down database...

```

1. Click Next and you can setup shotcuts. We recommend setting up shortcuts in the Start Menu and on the Desktop.  We did NOT mark "Launch on Startup.  When intallation is complete, your installation screen should give you this message: 

```
On Windows and Linux, use the eXist-db start menu item or desktop icon for launching eXist-db. On Mac OS, double-click the eXist-db.app icon inside the folder in which eXist-db is installed.
You can also launch eXist-db by double-clicking on start.jar or by calling "java -jar start.jar" on a command line.
Launching eXist-db in one of these ways will display a splash screen while starting up the database. After startup, you will find an eXist-db icon in your system tray/menu bar. Click (Windows and Mac OS) or right-click (Linux) on the icon to get a popup menu with further options.

```
## Launching eXist

### Windows
1. On Windows, click on your launch shortcut icon. You'll be asked to configure your Java memory, and you can change some of the settings. Notice the Jetty Ports listed on this screen. Do you have anything else on your system that uses its ports? If you're curious about this, try running this command in your git Bash shell: `netstat -a`, and you will see all of the ports sending and receiving information on your computer! eXist's default port `8080` is a low numbered one so you can check to see if it is already running. (It is probably not.) If it is, you can just change the number to something else that is not in use. Click Save.
 * If you see something like an "Error Running Process" : Cannot run program ""C:\Program Files\Java\jre1.8.0_271\bin\javw.exe"" (in directory "C:\Users\Lisa\Desktop\eXist:): CreateProcess error=206 The filename or extension is too long." that's  sign that you've probably installed in a problematic location like we did the first time (like the Desktop). Go back and redo the installation. 
1. Windows will prompt you to run eXist-db as a service on Windows. "Not doing so may lead to dat loss if you shut down the computer before eXist-db." (We recommend clicking to install the service: you'll probably need to click through a couple of screens permitting Apache Commons to run a web service.) 
1. At this point in the background I could see that Windows Defender Firewall had blocked some features of this app. We recommend ONLY allowing Java to communicate on Private networks, not public ones! 
1. At this point, you should be able to open a web browser to the address: `localhost:8080`. If all is well, you will see the eXist-dB logo come up! There should be an ”X”-shaped eXist-dB icon in your system tray which you can use to start and stop the eXist-dB server.


### Mac
1. When you launch eXist-dB, watch for the eXist ”X”-shaped icon to appear in your system menu along the top of your screen. If you click on it you can see it gives you controls to start and stop the server. 
1. Open a web browser to `localhost:8080` and access eXist-dB as an administrator! 


## Working with eXist-dB (all versions)
1. Open eXide, and try out the File menu. You are admin over this space, so make sure you login, using your password if you set one, or leaving the password box blank if you did not.  You will see two folders in the DB Manager: "apps" and "system". Leave those alone, and you can try uploading file directories with XML in them here to treat as collections for XQuery work.
1. You can also save your queries in the database, and we recommend storing these in a separate file directory, apart from your collections. Save queries with the file extension `.xql` .
