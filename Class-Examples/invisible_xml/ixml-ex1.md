# Invisible XML (ixml) Exercise 1

## Source file: Pokemon Moves Generation 5
Let's start with this plain text document representing data about Pokemon moves from generation 5, sourced from [the Pokemon Database](https://pokemondb.net/move/generation/5).

<https://raw.githubusercontent.com/newtfire/textAnalysis-Hub/refs/heads/main/Class-Examples/invisible_xml/pokemon-moves-gen5.txt> 

You can follow the link to download and save this directly, or use `git pull` on the main branch of  the textAnalysis-Hub/Class-Examples/invisible_xml/pokemon-moves-gen5.txt. Save it in a folder with your personal repo / homework to work on together with an invisible xml grammar file.

The file has newlines and tab characters giving it a clear structure. The first 13 lines are meant to be column headers, but were formatted differently. The rest of the file uses tab characters to provide information about:
*  the **name** of a move 
*  the **type** of a move
*  the **category** (cat.) of a move
*  the **power** of a move (in digits) 
*  the **accuracy** (acc.) of a move (in digits)
*  the **power points** (pp) of a move (in digits)
*  the **effect** of a move.

**Consult our guide to ["Writing your First Invisible XML"](https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/invisible_xml/iXMLstart.md)** as you work on this exercise. 

Your task is to create an invisible XML grammar that represents a good XML model of your choice, organizing this information into elements and/or attributes. 

## Setting up your workspace

* We suggest opening the text file in oXygen
* Open a second text file to save with the **`.ixml`** extension to write your Invisible XML grammar, and save it in the same directory with the pokemon-moves-gen5.txt file.
* Make sure that you can see all the different space characters (just like for Regex tasks): If this is turned off, go to your oXygen XML Editor Settings (or Options >> Preferences), choose Editor and tick the two checkboxes for "Show TAB/NBSB/EOL/EOF marks" and "Show SPACE marks". 
* Split your windows in oXygen (as we suggest for working on CSS or Relax NG files) using **Window >> Tile Editors Vertically**.

## Guidance 

### Tiny Starter Orientation: Can you fully process just the heading?
To get started, we can just try isolating the heading into its own separate text file, just to get used to writing ixml and making sure you know how to process a grammar. (Afterwards you'll incorporate your ixml for this heading into the full XML for the whole document.)  Save this portion in its own file, and open it in oXygen so you can see the line numbers!

```
Name
	
Type
	
Cat.
	
Power
	
Acc.
	
PP
	
Effect
```
**Make sure there's NOT an extra newline after the last row for Effect,** to mimic the formatting in the larger document! (That **single newline** at the end will be significant for our separation of the heading from the rest of the document later!) 

Try to wrap this whole text in one XML root element (without worrying about distinguishing inner element just yet..) Can you describe the formatting to wrap this in one element? 

The reason we're doing this is so you can test your first grammar quickly! Save your .ixml grammar file in the same folder with the text files, and open your shell, navigate to the directory where you saved your work, and run coffeepot to see if it works, using this format:

```shell
coffeepot -g:yourGrammar.ixml -i:heading.txt
```
We suggest that when you can write a grammar to represent this, and the grammar processes without ambiguity and shows you some XML output, you're ready to continue. To process Invisible XML and test your grammar, you DO have to represent a complete XML document with a single root element. (You don't have to have all the "guts" of the document converted into special elements, but you do need to be able to define that root element and account for its contents accurately.)

### The Whole Document

When you're ready, try writing a grammar to represent the whole pokemon-moves-gen5.txt document. 

This time, wrap the meaningful portions in an XML hierarchy with:

*  "container" elements to store the full information about each distinct move, for example: `<move>`
* elements and/or attributes inside that element that store specific information, for example: `<name>`, `<type>`, etc. 

You can be creative with storing some information in attributes or letting it be a text node of an element. 
     
 Because this text is very regularly formatted,  you want to skim through it and take some notes first on the formatting of the different pieces. 

* The *name* will have to account for one- *or* two-word names (there will sometimes, but not always be a space in between upper- and lower-case letters).
* You want to be specifying the tab characters as distinct from simple spaces and newlines in your grammar. (Unlike regex, there isn't a single character class for all the different kinds of spaces, and for *this* document you really want to differentiate the kinds of spaces in your grammar.)
	* You can use the `#9` character code for tabs
	* You can use the `#20` character code for the spacebar spaces. 
	* Note: **you don't want quotation marks** around these character codes, or around character classes either. 
* Notice that sometimes numbers are replaced with this character, `—`, known as an "em dash" (because it's as wide as the letter "m").  To capture this special character, use the character code`#2014`.  This affects each of the different numerical nodes in the document.
* For the *effect*, punctuation marks are present along with alphabet characters and spaces. For this kind of complexity, you might seriously want something like the regular expressions "dot matches all, but don't be greedy" method. Alas, we don't have a "dot" in Invisible XML, but we *do* have something that approaches it. What we can do is define this stretch as characters that are **NOT** those in a special set, like this:

```
~[#9;#d;#a]+
```
With the tilde `~` character, this says, "look for any character that is **not** a tab character or a Windows or Posix (Mac/Linux) newline return character." The plus sign at the end indicates "one or more". This will look for anything that is NOT some kind of separator character.

#### Coping with Ambiguity
**Ambiguity** or **ambiguous parsing** in Invisible XML means there's more than one way to interpret the grammar when applying it to the source document. For more on coping with ambiguity, see [David Birnbaum's helpful explanation](https://dh.obdurodon.org/ixml-ambiguity.xhtml). 

We found that some of our handling of spaces could introduce problems with ambiguous ixml parses when we practiced this assignment. This observation may help you to avoid the problems we saw! Notice in between some of the nodes, you'll sometimes see a spacebar-type space. In oXygen with the space characters made visible, you'll see it something like this: 
```
· ┘
```
Try to account for the possible presence of a space before the tab. You might think of these as separator characters that you don't need to appear in the XML nodes that you are constructing. 

## When you're finished 
When you're producing good XML in your shell, you want to save that! With coffeepot, you add the `-o:` command at the end to define where you want to save output. When you run this, you won't see the XML output in your shell anymore. Browse to where you said to save the file and open it in oXygen to see how it turned out!

```shell
coffeepot -g:yourGrammar.ixml -i:pokemon-moves-gen5.txt  -o:pokeMovesGen5.xml
```
Try this out in blitz too!  In Markup Blitz. Add a `>` and a filename.xml to store your output like this:

```shell
blitz yourGrammar.ixml  pokemon-moves-gen5.txt  > pokeMovesGen5.xml
```
### What to submit on Canvas

* your Invisible XML grammar (.ixml)
* the output XML (.xml) if you were successful)
* a message in the text box on how this went, if you produced ambiguous XML, or (if you weren't successful with outputting XML) indicating what's wrong and what you attempted to fix it.