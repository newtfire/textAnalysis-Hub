# Invisible XML (ixml) / XProc Installations (for macOS)

This document provides installation and configuration instructions for macOS users.

These instructions are adapted from:
<http://dh.obdurodon.org/ixml-and-xproc-configuration.xhtml>

This setup supports a tutorial initially developed in Spring 2025:
<http://dh.obdurodon.org/ixml-and-xproc-lesson-plan.xhtml>

This is cool coffee art:

          _ 
        C| |/        
         |_|    {_}D
	
       coffee   mug
         pot      

*********************

# Table of Contents

* [**Preliminary Installations & Suggestions**](#preliminary-installations--suggestions)
	* [Installing Homebrew](#installing-homebrew)
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
		* [Installing CoffeeSacks](#installing-coffeesacks)
		* [Configuring Calabash](#configuring-calabash)
		* [Creating an Alias for Calabash](#creating-an-alias-for-calabash)
		* [Smoke Test for Calabash](#smoke-test-for-calabash)
    	* [Running Calabash](#running-calabash)
	* [**Morgana**](#morgana)
		* [Installing Morgana](#installing-morgana)
		* [Installing SchXslt2](#installing-schxslt2)
		* [Installing CoffeeGrinder and CoffeeFilter](#installing-coffeegrinder-and-coffeefilter)
		* [Configuring Morgana](#configuring-morgana)
		* [Creating an Alias for Morgana](#creating-an-alias-for-morgana)
		* [Testing Morgana](#testing-morgana)
* [**Completion**](#completion)

*********************

# Preliminary Installations & Suggestions

## Installing Homebrew

<img src="images/homebrew.png" alt="homebrew logo" width="500"/>

Homebrew is a package manager for macOS. It will help you install things quickly from your Terminal. We'll use it for installing OpenJDK, but it's a great tool to have in your toolbag for other future installations. You can [view their website](https://brew.sh/) for full instructions and other nerdy stuff.

1. Open a new terminal window.
1. Run the Homebrew installation command from their website:

	```shell
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	```

1. You'll be asked to enter your password. This means the local password you use to login to your computer. *The password will not appear as you type it. This is a security feature.*
	* You *might* receive an error for sudo (**s**ubstitude **u**ser **do**)
		* To fix this error, take the download code line for homebrew and add `sudo ` before it: 

		```shell
		sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		``` 
	
	* After running this line, you will be asked to enter your password.
	* Once you enter your password, the terminal will the state `Checking for sudo access (which may request your password)... Don't run this as root!`
	* After receiving this error, rerun the orginal Homebrew installation command:
	
		```shell
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		```

1. Follow the on-screen instructions.
1. When installation completes, run the three commands Homebrew provides to add it to your PATH (run each line separately).
1. Verify installation:

	```shell
	brew --version
	```

## Installing JDK

The Java Development Kit (OpenJDK) java environment is required for some of the ixml and XProc tools.

1. Check whether Java is installed:

	```shell
	java -version
	```

	* If Oracle Java is installed, uninstall it:
	<https://www.java.com/en/download/help/mac_uninstall_java.html>

1. Install OpenJDK using Homebrew:

	```shell
	brew install openjdk
	```

1. Add OpenJDK to your PATH:

	```shell
	echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc
	```

1. Restart your terminal.
1. Verify installation:

	```shell
	java -version
	```

## Installing Graphviz

Graphviz is required for CoffeePot and Calabash to render pipeline diagrams.

1. Test for Graphviz:

	```shell
	dot -V
	```

1. If missing, install it:

	```shell
	brew install graphviz
	```

 1. Verify installation:

	```shell
	dot -V
	```

*********************

## Suggestions

* There are a lot of installations throughout this process. To keep them organized, *it is a good idea to place them all in your GitHub directory since you should be familiar with that directory at this point.*
* To make things simpler for yourself, use the same alias names that I use in this tutorial, so when we're working on this in class, there's no confusion if your alias has a different name than mine.
* To **"smoke test"** means to see if your installation is working without running an actual file (using supplied test files or methods). It is important you do these at the end of each installation to verify everything should work properly when you use your own files.
* We also suggest you install 3 more helpful command-line tools via Homebrew:

	```shell
	brew install bat
	```

	```shell
	brew install xmlstarlet
	```

	```shell
	brew install xq
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

1. Open your `.zshrc` file:

	```shell
	nano ~/.zshrc
	```

1. Add an alias pointing to the CoffeePot JAR **(replace `USERNAME` with your username and `VERSION` with the latest version of CoffeePot that you downloaded—the version in the unzipped directory name)**:

	```shell
	alias coffeepot='java -jar /Users/USERNAME/Documents/GitHub/coffeepot-VERSION/coffeepot-VERSION.jar'
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
	graphviz=/opt/homebrew/bin/dot
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

1. Clone the repository:

	```shell
	git clone https://github.com/GuntherRademacher/markup-blitz.git
	```

1. Navigate to the cloned folder:

	```shell
	cd markup-blitz
	```

1. Build the JAR (macOS/Unix):

	```shell
	./gradlew clean jar
	```

1. The JAR will be in `build/libs/markup-blitz.jar`.

### Creating an Alias for Markup Blitz

1. Open your `.zshrc` file:

	```shell
	nano ~/.zshrc
	```

1. Add the alias **(replace `USERNAME` with your username)**:

	```shell
	alias blitz='java -jar /Users/USERNAME/Documents/GitHub/markup-blitz/build/libs/markup-blitz.jar'
	```

### Smoke Testing Markup Blitz

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

### Installing CoffeeSacks

CoffeeSacks is required to use ixml when running a pipeline with Calabash.

1. Download CoffeeSacks from:
	<https://codeberg.org/NineML/nineml/releases>
1. Copy the CoffeeSacks JAR into the `extra/` directory of Calabash.

### Configuring Calabash

1. Create the configuration file in your home directory:

	```shell
	nano ~/.xmlcalabash3
	```

1. Add:

	```xml
	<cc:xml-calabash xmlns:cc="https://xmlcalabash.com/ns/configuration">
	  <cc:graphviz dot="/opt/homebrew/bin/dot"/>
	</cc:xml-calabash>
	```

### Creating an Alias for Calabash

1. Open your `.zshrc` file:

	```shell
	nano ~/.zshrc
	```

1. Add **(replace `USERNAME` with your username and `VERSION` with the latest version that you downloaded—the version in the unzipped directory name)**:

	```shell
	alias calabash='/Users/USERNAME/Documents/GitHub/xmlcalabash-VERSION/xmlcalabash.sh --init:org.nineml.coffeesacks.RegisterCoffeeSacks'
	```

### Smoke Test for Calabash

1. Run:

	```shell
	calabash helloWorld.xpl
	```

 1. You should see the following message:

	```xml
	This message is printed when the identity step runs.
	It contains “😻” (U+201C, U+1F63B, U+201D) to test
	the console encoding's ability to display Unicode.
	<helloWorld>This is XML Calabash version 3.0.37.
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

Morgana is an XProc processor for complex pipelines.

### Installing Morgana

1. Download MorganaXProc-IIIse from:
	<https://www.xml-project.com/manual/index.html>
1. Unzip it into your GitHub directory.

### Installing SchXslt2

1. Visit the SchXslt2 releases page:
	<https://codeberg.org/SchXslt/schxslt2/releases>
1. Download **SchXslt2 version 1.7.2**.
1. Unzip it into your GitHub directory.

### Installing CoffeeGrinder and CoffeeFilter

1. Download CoffeeGrinder and CoffeeFilter from:
	<https://codeberg.org/NineML/nineml/releases>
1. Unzip both into your GitHub directory.

### Configuring Morgana

1. Create a configuration file:

	```shell
	nano ~/morgana-config.xml
	```

1. Add and adapt paths:

	```xml
	<morgana-config xmlns="http://www.xml-project.com/morganaxproc">
	  <path_to_SchXSLT2_transpiler>/Users/USERNAME/Documents/GitHub/schxslt2-1.7.2/transpile.xsl</path_to_SchXSLT2_transpiler>
	  <xslt-connector>Saxon12-3</xslt-connector>
	  <schematron-connector>schxslt2</schematron-connector>
	  <ixml-connector>com.xml_project.morganaxproc3.ninemlConnector.NineMLConnector</ixml-connector>
	</morgana-config>
	```

### Creating an Alias for Morgana

1. Edit `.zshrc`.
1. Add:

	```shell
	alias morgana='/Users/USERNAME/Documents/GitHub/MorganaXProc-IIIse-VERSION/Morgana.sh -config=/Users/USERNAME/morgana-config.xml'
	```

### Testing Morgana

1. Run:

	```shell
	morgana pipeline.xpl
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
        `-.__`.               ,' met.
    ,--------`"`-------------'--------.
     `"--.__                   __.--"'
            `""-------------""'
*ASCII art credits: <https://ascii.co.uk/art/cup>*
