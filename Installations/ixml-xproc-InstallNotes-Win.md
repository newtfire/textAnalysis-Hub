# Invisible XML (ixml) / XProc Installations (for Windows)

This document provides installation and configuration instructions for Windows users.

These instructions are adapted from:
<http://dh.obdurodon.org/ixml-and-xproc-configuration.xhtml>

This setup supports a tutorial initially developed in Spring 2025:
<http://dh.obdurodon.org/ixml-and-xproc-lesson-plan.xhtml>

This is cool coffee art:

               _ 
             \| |D         
      C{_}    |_|     
    
       mug   coffee 
              pot     

*********************

# Table of Contents

* [**Preliminary Installations & Suggestions**](#preliminary-installations--suggestions)
  	* [Windows Specifics](#windows-specifics)
	* [Installing Chocolatey](#installing-chocolatey)
	* [Installing JDK](#installing-jdk)
	* [Installing Graphviz](#installing-graphviz)
	* [Suggestions](#suggestions)
* [**Invisible XML (ixml) Processors**](#invisible-xml-ixml-processors)
	* [About the CoffeeTools](#about-the-coffeetools)
	* [**CoffeePot**](#coffeepot)
		* [Installing CoffeePot](#installing-coffeepot)
		* [Creating an Alias for CoffeePot](#creating-an-alias-for-coffeepot)
		* [Configuring CoffeePot](#configuring-coffeepot)
		* [Smoke Test for CoffeePot](#smoke-test-for-coffeepot)
    	* [Running CoffeePot](#running-coffeepot)
	* [**Markup Blitz**](#markup-blitz)
		* [Installing Markup Blitz](#installing-markup-blitz)
		* [Creating an Alias for Markup Blitz](#creating-an-alias-for-markup-blitz)
		* [Smoke Test for Markup Blitz](#smoke-test-for-markup-blitz)
		* [Running Markup Blitz](#running-markup-blitz)
* [**XProc Processors**](#xproc-processors)
	* [**Calabash**](#calabash)
		* [Installing Calabash](#installing-calabash)
		* [Configuring Calabash](#configuring-calabash)
		* [Creating an Alias for Calabash](#creating-an-alias-for-calabash)
		* [Smoke Test for Calabash](#smoke-test-for-calabash)
    	* [Running Calabash](#running-calabash)
	* [**Morgana**](#morgana)
		* [Installing Morgana](#installing-morgana)
		* [Installing SchXslt2](#installing-schxslt2)
		* [Installing CoffeeGrinder and CoffeeFilter](#installing-coffeegrinder-and-coffeefilter)
        * [Modifying Morgana.bat](#modifying-morganabat)
		* [Configuring Morgana](#configuring-morgana)
		* [Creating an Alias for Morgana](#creating-an-alias-for-morgana)
		* [Smoke Test for Morgana](#smoke-test-for-morgana)
* [**Completion**](#completion)

*********************

# Preliminary Installations & Suggestions

## Windows Specifics

You will need to be familiar with two different shells for these installations:

* Windows PowerShell Admin mode (select *Run in Administrator*)
* Git Bash Shell (to interface with GitHub)

You will also need to:

* Create a `.bashrc` file for storing aliases (similar to `.zshrc` on macOS)
* Find and edit system PATH variables. Some of this can be done in Control Panel.
* Know how to work with Windows filepaths. Windows filepaths can be typed in three different ways (and you may see all three ways in these instructions):
	
	* **Native Windows format**. This will be used for anything in the Program Files folder (note the capital drive letter followed by a colon, and the back slashes).
		
	```shell
	C:\Program Files\...
	```
		  
	* **Full filepaths**.
		
	```shell
	/c/Users/USERNAME/Documents/GitHub/...
	```
		  
	* **Abbreviated filepaths**.
		
	```shell
	~/Documents/GitHub/...
	```

## Installing Chocolatey

<img src="images/chocolatey.png" alt="chocolatey logo" width="500"/>

Chocolatey is a package manager for Windows. It will help you install things quickly at command line. We'll use it for installing OpenJDK, but it's a great tool to have in your toolbag for other future installations. You can [view their website](https://chocolatey.org/install) for full instructions and other nerdy stuff.

1. Open Windows PowerShell in administrator mode ("Run as Administrator").
1. Run the following command:

   ```shell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```
   
1. Verify installation by installing [Marktext](https://marktext.me/), a popular free markdown editor which you will find very helpful for writing markdown:

	```shell
	choco install marktext
	```

## Installing JDK

The Java Development Kit (OpenJDK) java environment is required for some of the ixml and XProc tools.

1. Open Windows PowerShell in administrator mode ("Run as Administrator").
1. Check whether Java is installed:

	```shell
	java -version
	```

	* If Oracle Java is installed, uninstall it:
	<https://www.java.com/en/download/help/uninstall_java.html>

1. Install OpenJDK using Chocolatey:

	```shell
	choco install openjdk
	```

1. Open up the app called System Properties.
1. Navigate to Advanced > Environment Variables... > JAVA_HOME
1. Edit the `JAVA HOME` variable and paste the location where OpenJDK was installed (if you are unsure where this is, you can open a Git Bash shell, type `where java`, and copy that filepath).
   * *Note: the path needs to be to the folder that's inside `OpenJDK`. It should look something like `C:\Program Files\OpenJDK\jdk-22.0.2\`.*
   * *See the image below for this process:*

   ![](images/environment_variables-win.png)
1. Restart your shell.
1. Verify installation:

	```shell
	java -version
	```

## Installing Graphviz

Graphviz is required for CoffeePot and Calabash to render pipeline diagrams.

1. Test for Graphviz in a Git Bash Shell:

	```shell
	dot -V
	```

1. If missing, install it:

	```shell
	choco install graphviz
	```

 1. Verify installation:

	```shell
	dot -V
	```

*********************

## Suggestions

* There are a lot of installations throughout this process. To keep them organized, *it is a good idea to place them all in your GitHub directory (inside your non-OneDrive synced Documents folder) since you should be familiar with that directory at this point.*
* To make things simpler for yourself, use the same alias names that I use in this tutorial, so when we're working on this in class, there's no confusion if your alias has a different name than mine.
* To **"smoke test"** means to see if your installation is working without running an actual file (using supplied test files or methods). It is important you do these at the end of each installation to verify everything should work properly when you use your own files.
* We also suggest you install 2 more helpful command-line tools via Chocolatey:

	```shell
	chocolatey install bat
	```

	```shell
	chocolatey install xmlstarlet
	```

*********************

# Invisible XML (ixml) Processors

## About the CoffeeTools

Invisible XML processing in this course uses four tools developed by the NineML project:

*  CoffeeGrinder (Earley and GLL parsers)
*  CoffeeFilter (An Invisible XML parser)
*  CoffeePot (An Invisible XML processor)
*  CoffeeSacks (Saxon APIs for Invisible XML)

Canonical documentation for all CoffeeTools:
<https://nineml.org/>

Latest releases for all Coffee tools:
<https://codeberg.org/NineML/nineml/releases>

## CoffeePot

CoffeePot is a command-line ixml processor. It's good for simple grammars and small input files.

### Installing CoffeePot

1. Visit the NineML releases page:
	<https://codeberg.org/NineML/nineml/releases>
1. Download the CoffeePot ZIP file from the latest release.
1. Unzip it into your GitHub directory.

### Creating an Alias for CoffeePot

1. Open your `.bashrc` file:

	```shell
	nano ~/.bashrc
	```

1. Add an alias pointing to the CoffeePot JAR **(replace `USERNAME` with your username and `VERSION` with the latest version of CoffeePot that you downloaded—the version in the unzipped directory name)**:

	```shell
	alias coffeepot='java -jar /c/Users/USERNAME/Documents/GitHub/coffeepot-VERSION/coffeepot-VERSION.jar'
	```

1. Save and reload your shell.

### Configuring CoffeePot

CoffeePot uses a `.nineml.properties` file in your home directory. This contains some helpful default settings when using CoffeePot such as "pretty-printing" your xml output.

1. Create the file in your home directory:

	```shell
	nano ~/.nineml.properties
	```

1. Add configuration settings:

	```shell
	graphviz=/c/Program Files/Graphviz/bin/dot.exe
	ignore-trailing-whitespace=true
	pretty-print=true
	progress-bar=tty
	assert-valid-xml-characters=true
	assert-valid-xml-names=true
	ignore-bom=true
	normalize-line-endings=true
	trailing-newline-on-output=true
	```

### Smoke Test for CoffeePot

1. Run the alias:

	```shell
	coffeepot
	```

1. You should see the usage message:

	```
 	Usage: ... -g:input.ixml -o:output.xml (--help for more details)
 	```

 	*  Key piece of info missing from this message:
  	 	Use: **`-i.filename.txt`** after `-g:input.ixml` to point to your input file.
    *  *Think of `-g` as standing for "grammar", `-i` as "input file", `and `-o` as "output file".*

### Running CoffeePot

1. If you have some ixml and a text file to run it on, go ahead and try it!

   	```shell
	coffeepot -g:filename.ixml -i:filename.txt
	```

2. You can add a couple of things to this command for more fun:
	*  **`--analyze-ambiguity`** *(so: `coffeepot -g:filename.ixml -i:filename.txt --analyze-ambiguity`)*
	*  **`--graph:filename.svg`** *(so: `coffeepot -g:filename.ixml -i:filename.txt --graph.filename.svg`)* to get some SVG output.
		* This is meant for small, simple things. CoffeePot won't be able to generate the SVG if it's going to be a large, complicated file.

## Markup Blitz

Markup Blitz is used for ixml processing with Morgana. Like CoffeePot, it can also be used at command line. It is better at handling more complex grammars and larger input files.

### Installing Markup Blitz

*This step will follow the official Markup Blitz instructions which can be found in their [GitHub repository](https://github.com/GuntherRademacher/markup-blitz).*

1. Open Git Bash Shell.
1. Clone the repository:

	```shell
	git clone https://github.com/GuntherRademacher/markup-blitz.git
	```

1. Navigate to the cloned folder:

	```shell
	cd markup-blitz
	```

1. Build the JAR:

	```shell
	./gradlew clean jar
	```

1. The JAR will be in `build/libs/markup-blitz.jar`.

### Creating an Alias for Markup Blitz

1. Open your `.bashrc` file:

	```shell
	nano ~/.bashrc
	```

1. Add the alias **(replace `USERNAME` with your username)**:

	```shell
	alias blitz='java -jar /c/Users/USERNAME/Documents/GitHub/markup-blitz/build/libs/markup-blitz.jar'
	```

### Smoke Test for Markup Blitz

1. Run:

	```shell
	blitz
	```

1. You should see the usage message:

   	```shell
	Usage: java -jar markup-blitz.jar [<OPTION>...] [<GRAMMAR>] <INPUT>
	
	. . . more stuff below . . .
    ```

### Running Markup Blitz

1. To process an ixml grammar and input file:

	```shell
	blitz filename.ixml filename.txt
	```

*********************

# XProc Processors

## Calabash

Calabash is an XProc 3.0 processor developed by the same people that made the CoffeeTools.

### Installing Calabash

1. Visit:
	<https://codeberg.org/xmlcalabash/xmlcalabash3/releases>
1. Download the latest release ZIP.
1. Unzip it into your GitHub directory.
1. Navigate to the directory **(replace `VERSION` with the latest version that you downloaded—the version in the unzipped directory name)**:

	```shell
	cd ~/Documents/GitHub/xmlcalabash-VERSION
	```

1. Test **(replace `VERSION` with the latest version that you downloaded—the version in the unzipped directory name)**:

	```shell
	java -jar xmlcalabash-app-VERSION.jar help
	```

### Configuring Calabash

1. 1. First, find out where your graphviz "dot" is installed by entering this command:

    ```shell
    which dot
    ```
 Copy the file location you see. You'll use this in the next step.
 
1. Create the configuration file in your home directory:

	```shell
	nano ~/.xmlcalabash3
	```

1. Add:

	```xml
	<cc:xml-calabash xmlns:cc="https://xmlcalabash.com/ns/configuration">
	  <cc:graphviz dot="C:\PATH\TO\YOUR\bin\dot"/>
	</cc:xml-calabash>
	```
Change that value to wherever your local dot is stored (as in `dot="C:\ProgramData\Chocolatey\bin\dot"`). 


### Creating an Alias for Calabash

1. Open your `.bashrc` file:

	```shell
	nano ~/.bashrc
	```

1. Add **(replace `USERNAME` with your username and `VERSION` with the latest version that you downloaded—the version in the unzipped directory name)**:

	```shell
	alias calabash='/c/Users/USERNAME/Documents/GitHub/xmlcalabash-VERSION/xmlcalabash.sh'
	```

### Smoke Test for Calabash

1. Navigate to your `xmlcalabash-VERSION` directory.
1. Run:

	```shell
	calabash helloWorld.xpl
	```

 1. You should see the following message:

	```xml
	This message is printed when the identity step runs.
	It contains “😻” (U+201C, U+1F63B, U+201D) to test
	the console encoding's ability to display Unicode.
	<helloWorld>This is XML Calabash version *[3.0.37]*.
	Share and enjoy!</helloWorld>%
 	```

 ### Running Calabash

 1. When you have an XProc pipeline file (`.xpl`) ready to run:

	```shell
 	calabash filename.xpl
 	```

 2. To see some nifty Graphviz sketches of your pipeline, add `--graphs:.` to the command:

    ```shell
 	calabash filename.xpl --graphs:.
 	```

*********************

## Morgana

Morgana is an XProc processor for complex pipelines. It works well with [Markup Blitz](#markup-blitz).

Official documentation: <https://www.xml-project.com/manual/index.html>

### Installing Morgana

1. Download MorganaXProc-IIIse from:
	<https://sourceforge.net/projects/morganaxproc-iiise/>
1. Unzip it into your GitHub directory.

### Installing SchXslt2

SchXslt2 (pronounced "Shicksilt" ... be careful with that one!) is an XSLT-based Schematron processor that can handle Schematron validation.

1. Visit the SchXslt2 releases page:
	<https://codeberg.org/SchXslt/schxslt2/releases>
1. Download the ZIP directory from the latest release.
1. Unzip it into your GitHub directory.

### Installing CoffeeGrinder and CoffeeFilter

Calabash (being created by NineML's developers) comes with the JAR files for CoffeeGrinder and CoffeeFilter. In order to use CoffeeTools with Morgana, we can download and point to them separately.

1. Download CoffeeGrinder and CoffeeFilter from:
	<https://codeberg.org/NineML/nineml/releases>
1. Unzip both into your GitHub directory.

### Modifying Morgana.bat

Now, we need to make sure Morgana’s executable script (`Morgana.bat`) can locate the external JAR files required for ixml processing, including CoffeeGrinder, CoffeeFilter, and Markup Blitz.

1. Navigate in your shell to the directory where you unzipped Morgana **(replace `VERSION` with the version in the directory name)**:

	```shell
	cd ~/Documents/GitHub/MorganaXProc-IIIse-VERSION
	```

1. Open `Morgana.bat` for editing:

	```shell
	nano Morgana.bat
	```
 
1. This should be the first line:

   ```shell
   #CURRENT_SCRIPT="$(readlink -f "$0")"  #resolves symlinks on unix based systems (Does not work on BSD systems like MacOS)
   ```
   
1. Locate the section marked `REM Local customization`.

	Add and adjust the following lines **(replace `USERNAME` with your username and `VERSION` with the version numbers in the unzipped directory names)**:

	```shell
	#REM Local customization
	set SAXON_JAR=/c/Users/USERNAME/Documents/GitHub/xmlcalabash-VERSION/lib/Saxon-HE-VERSION.jar
	set COFFEEGRINDER_JAR=/c/Users/USERNAME/Documents/GitHub/coffeegrinder-VERSION/CoffeeGrinder-VERSION.jar
	set COFFEEFILTER_JAR=/c/Users/USERNAME/Documents/GitHub/coffeefilter-VERSION/CoffeeFilter-VERSION.jar
	set BLITZ_JAR=/c/Users/USERNAME/Documents/GitHub/markup-blitz/build/libs/markup-blitz.jar
	```

	*NOTE: The `markup-blitz.jar` path assumes you installed Markup Blitz in your GitHub directory following the earlier instructions. If you installed it elsewhere, adjust the path accordingly.*

1. Near the end of the file, locate the `CLASSPATH` definition.

	Edit it so that it includes all of the local customization variables. It should look like this:

	```shell
	set CLASSPATH=$MORGANA_LIB:$MORGANA_HOME/MorganaXProc-IIIse.jar:$BLITZ_JAR:$COFFEEGRINDER_JAR:$COFFEEFILTER_JAR:$SAXON_JAR
	```

	Basically, this pours Markup Blitz through a coffee grinder, into a coffee filter, and then through some Saxon, all before landing in a Morgana mug.

1. Save the file and exit the editor.

Morgana is now configured to use Markup Blitz (or the CoffeeTools) for ixml processing.

### Configuring Morgana

1. Create the configuration file in your home directory:

	```shell
	nano ~/morgana-config.xml
	```

1. Add **(replace `USERNAME` with your username and `VERSION` with the latest version that you downloaded—the version in the unzipped directory name)**:

	```xml
	<morgana-config xmlns="http://www.xml-project.com/morganaxproc">
	<!-- Relative paths are resolved by uri of this file -->
 
		 <path_to_SchXSLT2_transpiler>/c/Users/USERNAME/Documents/GitHub/schxslt2-VERSION/transpile.xsl</path_to_SchXSLT2_transpiler>

 		 <XSLTValidationMode>LAX</XSLTValidationMode>
 		 <silent>true</silent>
 
		 <xslt-connector>Saxon12-3</xslt-connector>
 		 <xquery-connector>Saxon12-3</xquery-connector>
		 <schematron-connector>schxslt2</schematron-connector>

 		 <!-- Switch between these for Coffee or Markup Blitz)
 		 <!-- <ixml-connector>com.xml_project.morganaxproc3.ninemlConnector.NineMLConnector</ixml-connector> -->
		 <ixml-connector>com.xml_project.morganaxproc3.markupblitzConnector.MarkupBlitzConnector</ixml-connector>
	</morgana-config>
	```

### Creating an Alias for Morgana

1. Open your `.bashrc` file:

	```shell
	nano ~/.bashrc
	```
 
1. Add **(replace `USERNAME` with your username and `VERSION` with the latest version that you downloaded—the version in the unzipped directory name)**:

	```shell
	alias morgana='/c/Users/USERNAME/Documents/GitHub/MorganaXProc-IIIse-VERSION/Morgana.sh -config=/c/Users/USERNAME/morgana-config.xml'
	```

### Smoke Test for Morgana

1. Navigate to your `MorganaXProc-IIIse-VERSION` directory.
1. Run:

	```shell
	morgana pipeline.xpl
	```

 1. You should see the following message:

	```shell
	Hello world. This is an XProc 3.0 pipeline running.
	```

*********************

# Completion

Congratulations! You have everything you need to:
*  Convert text files to XML according to your ixml grammar definition, AND
*  Set that ixml conversion into a processing pipeline that can also apply XSLT, XQuery, and Schematron to the XML that you create with ixml!

Have fun pouring text through grammars, filters, grinders, and pipelines!

                      .
                        `:.
                          `:.
                  .:'     ,::
                 .:'      ;:'
                 ::      ;:'
                  :    .:'
                   `.  :.
          _________________________
         : _ _ _ _ _ _ _ _ _ _ _ _ :
     ,---:".".".".".".".".".".".".":
    : ,'"`::.:.:.:.:.:.:.:.:.:.:.::'
    `.`.  `:-===-===-===-===-===-:'
      `.`-._:                   :
        `-.__`.               ,'
    ,--------`"`-------------'--------.
     `"--.__                   __.--"'
            `""-------------""'
*ASCII art credits: <https://ascii.co.uk/art/cup>*
