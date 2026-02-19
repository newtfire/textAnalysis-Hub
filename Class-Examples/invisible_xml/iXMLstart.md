# Writing Your First ixml
by Lauren McCurdy and Molly Wright, Penn State Behrend Digit Program

This guide was written in reference to Norm Tovey-Walsh's [Writing Invisible XML Grammars](https://www.xml.com/articles/2025/12/16/invisible-xml-grammars-update/). 

Take a look at the original article for more in depth explanations and additional examples if needed. 
## Understanding ixml Rules

An ixml **grammar** consists of rules. Each rule has a "left hand side" and a "right hand side". The left hand side is a single symbol, which is the title of something that's being defined. The right hand side is a list of one or more symbols that define it.

**What is a grammar?** A grammar is a collection of rules that defines how to match parts of the input text. Your entire ixml document is a grammar, and every rule contributes to describing the structure you expect in the input.


### Basic Syntax: How to Write a Grammar

A **rule** has the form of a name (the left hand side) followed by a colon, followed by one or more symbols (the right hand side), followed by a period. If more than one symbol appears on the right hand side, they must be separated by commas:

```shell
symbol-name: defining, symbols, here.
```

Invisible XML allows only a single rule for any given name. If you want to express that a symbol can have two or more definitions, separate the alternatives with semicolons.

This rule says a "thing" is a "this" followed by a "that":

```shell
thing: this, that.
```

This rule says a "thing" is a "this" OR a "that":


```shell
thing: this; that.
```

Whitespace around punctuation is insignificant. `"this;that"` is the same as `"this; that"`.





## Understanding ixml Symbols and Structure

**Nonterminals** are the symbols you define with rules — they're the names on the left-hand side, before the colon. They represent patterns or structures in your text that get converted to XML elements. For example, if you write:

```shell
month: "January"; "February"; "March".
```

Then `month` is a **nonterminal**. When the processor matches one of those month names in your input, it creates a `<month>` element in the XML output.

**Terminals** are the symbols that match characters explicitly in your input. In the example above, `"January"`, `"February"`, and `"March"` are **terminals** - they match those exact words in your input. 


### Mixing and Matching

A nonterminal may be defined using another nonterminal. Let's add to the previous example:

```shell
date: month.
month: "January"; "February"; "March".
```
When a rule refers to other nonterminals, it might help to think of the output to better understand what's happening:

```
<date>
	<month>January</month>
</date>
```

Elements can contain other elements ("nesting"), so nonterminals can - and most likely will - contain other nonterminals.

### Excluding Terminals
There will be instances where the original file you're working with will have structural markers you don't want in your XML output. Take this situation:


```shell
1/2/3
```

Each number is separated by a slash, but maybe for our purposes, it isn't important to preserve this formatting. 

On a **nonterminal**, adding a `-`supresses the element name, but keeps its content.

On a **terminal**, adding a  `-` suppresses the content.

Our grammar might look like this:


```shell
line: num, slash, num, slash, num.
num: [N].
-slash: -#2F.
```

The hyphen `-` before the `slash`nonterminal means that the `<slash>` **element** will not appear in the final output. The hyphen `-` before `#2F` suppresses the slash itself.


### Attributes
**Attributes** are created using the `@` symbol. The `@` only applies to nonterminals.

When a nonterminal is marked with `@`, it will become an attribute instead of an element in the XML output.

The **name** of the attribute comes from the nonterminal name

The **value** is whatever the nonterminal matches in the input. 

For instance with the rule:
```shell
@year: digit, digit, digit, digit.
```
If the input is `2022`, the XML output would look like this:
```shell
<date year="2022">
   <day>7</day> 
   <month>March</month>
</date>
```

**Attributes do not need to appear first in the input.** It doesn't matter if the input that matches the `@` nonterminal appears before or after other elements. The processor will still attach it as an attribute in the XML output. Generally, the order your rules appear doesn't matter too much.
## Testing Your Grammar
In order to test your grammar with a processor like CoffeePot or MarkupBlitz, there needs to be a nonterminal that defines the whole document. In other words, a root element. For example:   
```
date: year, -'-', month, -'-', day .
year: digit+.
month: digit, digit.
day: digit, digit.
-digit: ["0"-"9"].
```
The nonterminal `date` serves as the root element to define the complete structure of the document. 
 If you were to parse the date, “2022-03-07”, with that grammar, you would get:
 ```
<date>
	<year>2022</year>
	<month>03</month>
	<day>07</day>
</date>
```
## Organizing the Right Hand Side

### Building blocks
The right-hand side of a rule is organized into levels:

- **Factors** — the basic building blocks: terminals (quoted text like `"January"`), nonterminals (names of other rules), or grouped alternatives in parentheses.
- **Terms** — separated by commas (`,`), forming a sequence.
- **Alternatives** — separated by semicolons (`;`), offering different ways to match the same nonterminal.


You can use parentheses to group alternatives together. For example:

```shell
memo: recipient, (date, sender ; sender, date), content.
```

Here, the middle part can match either date followed by sender, OR sender followed by date.

### Character Sets
**Character sets** can be inclusive (all these characters) or exclusive (any characters except these). They are defined using **square brackets** and contain literal strings, encoded characters, character ranges, or Unicode character classes. 

For instance: 
```shell
num: ["0"-"5"].
```

This is a **range**, which consists of a character string containing a single character (or an encoded character) followed by a hyphen, followed by another single character string (or encoded character).

This example will match any digit from 0 to 5, inclusive. Keep in mind that the quotation marks are necessary. This different from regex ranges! Don't forget the quotes around *any* text pattern you're defining. 


## Unicode Characters and Classes

**What is Unicode?** Unicode is a universal character encoding system that assigns every character—from all languages and symbol sets—a unique code point. This lets grammars reliably match a wide range of characters.

**Character Codes** In ixml, you cannot put actual line breaks, tabs, or other special characters directly into quoted strings. To represent these invisible characters or symbols, ixml uses encoded characters written as a number sign ("#") followed by hexadecimal digits. Each encoded character can represent any Unicode character.

Most special character codes in ixml match the Unicode equivalent. A tab is represented in unicode as U+0009. Replacing "U+000" with "#" yields the ixml code, #9.

**Character Classes** Character classes allow you to match characters based on predefined Unicode categories. 

For example: 
```
num: [N].
```
Instead of listing every digit manually, you can use the Unicode character class `N` which will match all numeric digits.
### Excluding a Character Set or Class
Adding a tilde ('\~') before a symbol changes a rule from matching that character/symbol to matching anything *except* for itself. 

For example:

```shell
notNum: ~[N].
```
The above code will recognize a letter, whitespace, etc. as a `notNum`, but will not recognize any numerical digit.

### Useful Character Codes

You may find the following values useful as you construct your ixml grammar:

| Character | Character Code (Hex value) |
|-----------|----------------------------|
| Tab | `#9` |
| Quotation mark (") | `#22` |
| Newline (CR?, LF) | `#d?, #a` |
| Em dash| `#2014` |
| Space | `#20` |

## Further Readings
Here are some more helpful resources to check out as you continue learning about Invisible XML and writing grammar:

Steven Pemberton, ["Invisible XML (ixml) Tutorial](https://www.xml.com/articles/2022/03/28/writing-invisible-xml-grammars/)

David J. Birnbaum, [Invisible XML and Ambiguity](http://dh.obdurodon.org/ixml-ambiguity.xhtml)
