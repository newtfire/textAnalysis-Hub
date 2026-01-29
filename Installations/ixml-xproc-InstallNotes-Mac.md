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
	* [About the Coffee Tools](#about-the-coffee-tools)
	* [**CoffeePot**](#coffeepot)
		* [Installing CoffeePot](#installing-coffeepot)
		* [Creating an Alias for CoffeePot](#creating-an-alias-for-coffeepot)
		* [Configuring CoffeePot](#configuring-coffeepot)
		* [Testing CoffeePot](#testing-coffeepot)
* [**XProc Processors**](#xproc-processors)
	* [**Calabash**](#calabash)
		* [Installing Calabash](#installing-calabash)
		* [Installing CoffeeSacks](#installing-coffeesacks)
		* [Configuring Calabash](#configuring-calabash)
		* [Creating an Alias for Calabash](#creating-an-alias-for-calabash)
		* [Testing Calabash](#testing-calabash)
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

Homebrew is a package manager for macOS. It will help you install things quickly from your Terminal. We'll use it for installing OpenJDK, but it's a great tool to have in your toolbag for other future installations. You can [view their website](https://brew.sh/) for full instructions and other nerdy stuff.

1. Open a new terminal window.
1. Run the Homebrew installation command:

	```shell
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	```

1. You'll be asked to enter your password. This means the local password you use to login to your computer. *The password will not appear as you type it. This is a security feature.*
1. Follow the on-screen instructions.
1. When installation completes, run the three commands Homebrew provides to add it to your PATH.
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

1. If Oracle Java is installed, uninstall it:
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

Graphviz is required for diagram generation in both CoffeePot and XProc tools.

1. Test whether Graphviz is installed:

	```shell
	dot -V
	```

1. If it is not installed, install it using Homebrew:

	```shell
	brew install graphviz
	```

## Suggestions

* There are a lot of installations throughout this process. To keep them organized, *it is a good idea to place them all in your GitHub directory since you should be familiar with that directory at this point.*
* To make things simpler for yourself, use the same alias names that I use in this tutorial, so when we're working on this in class, there's no confusion if your alias has a different name than mine.
* We also suggest you install 3 more helpful command line tools via Homebrew:

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

1. CoffeePot
1. CoffeeGrinder
1. CoffeeFilter
1. CoffeeSacks

Canonical documentation for all Coffee tools:
<https://nineml.org/>

Latest releases for all Coffee tools:
<https://codeberg.org/NineML/nineml/releases>

Download the four ZIP files with version numbers in their names.

## CoffeePot

CoffeePot is a command-line ixml processor.

### Installing CoffeePot

1. Visit the NineML releases page:
	<https://codeberg.org/NineML/nineml/releases>
1. Download the CoffeePot ZIP file.
1. Unzip it into your GitHub directory.

### Creating an Alias for CoffeePot

1. Open your `.zshrc` file:

	```shell
	nano ~/.zshrc
	```

1. Add an alias pointing to the CoffeePot JAR:

	```shell
	alias coffeepot='java -jar /Users/USERNAME/Documents/GitHub/coffeepot-VERSION/coffeepot-VERSION.jar'
	```

1. Save and reload your shell.

### Configuring CoffeePot

CoffeePot uses a `.nineml.properties` file.

1. Create the file in your home directory:

	```shell
	nano ~/.nineml.properties
	```

1. Add configuration settings:

	```shell
	graphviz=/opt/homebrew/bin/dot
	pretty-print=true
	progress-bar=tty
	normalize-line-endings=true
	trailing-newline-on-output=true
	```

### Testing CoffeePot

1. Run the alias:

	```shell
	coffeepot
	```

1. You should see a usage message.

*********************

# XProc Processors

## Calabash

Calabash is an XProc 3.0 processor.

### Installing Calabash

1. Visit:
	<https://codeberg.org/xmlcalabash/xmlcalabash3/releases>
1. Download the latest release ZIP.
1. Unzip it into your GitHub directory.
1. Navigate to the directory:

	```shell
	cd ~/Documents/GitHub/xmlcalabash-VERSION
	```

1. Test:

	```shell
	java -jar xmlcalabash-app-VERSION.jar help
	```

### Installing CoffeeSacks

1. Download CoffeeSacks from:
	<https://codeberg.org/NineML/nineml/releases>
1. Copy the CoffeeSacks JAR into the `extra/` directory of Calabash.

### Configuring Calabash

1. Create the configuration file:

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

1. Edit `.zshrc`.
1. Add:

	```shell
	alias calabash='/Users/USERNAME/Documents/GitHub/xmlcalabash-VERSION/xmlcalabash.sh --init:org.nineml.coffeesacks.RegisterCoffeeSacks'
	```

### Testing Calabash

1. Run:

	```shell
	calabash helloWorld.xpl
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

You now have:

1. Invisible XML processing via CoffeePot
1. XProc pipelines via Calabash and Morgana
1. Integrated ixml, XSLT, XQuery, and Schematron processing

Have fun pouring text through grammars, filters, grinders, and pipelines.

*ASCII art credits: <https://ascii.co.uk/art/cup>*
