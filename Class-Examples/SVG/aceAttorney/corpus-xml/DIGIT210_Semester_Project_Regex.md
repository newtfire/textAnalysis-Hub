# DIGIT210 Semester Project
## Alyssa Hopple- Assistant Programmer
### March 17, 2024
I have done Regex commands to modify an entire corpus of ACE ATTORNEY transcripts. These searches
are not easy! I originally tested out the codes on a separate file on the individual Find/Replace
window before moving on to the corpus
itself to peform the Regex codes on Find/Replace in Files so these files wouldn't be ruined in
the first place.

The first thing I did was to wrap every line in a model P element so I can modify certain elements
later. On the Find slot, I wrote:

```
(^.+?$)
```
And on the Replace slot, I wrote:

```
<p>\1</p>
```

Next, I replaced the first P element, which is the name of the episode, with a unique Title element.
On the Find slot, I wrote:

```
\R<p>(.+?)</p>\R<p>Transcript</p>
```
**NOTE: In Find/Replace in Files, &bsol;n should be written as &bsol;R as recommended by oXygen's
text box denoting what &bsol;n means. Otherwise it would not work!**

And then, I wrote this on the Replace slot:

```
<title>\1</title>
```

Some transcripts contain information about how the respective transcript can also be in Japanese.
Here, we are only working on transcripts written in English. I omitted this information by using the
Find slot only. There, I wrote:

```
<p>Transcript \(JP\)</p>
```

Now, I will replace the P elements with Line elements. On the Find slot, I wrote:

```
<p>(.+?)</p>
```

And on the Replace slot, I wrote:

```
<line>\1</line>
```

I must extract lines where characters are speaking. On the Find slot, I wrote:

```
<line>([A-Z|\?\?\?].+?)\:</line>\R<line>(.+?)</line>
```

And then, on the Replace slot, I wrote:

```
<line speaker="\1">\2</line>
```

All other lines are other parts of the game, such as choices the player can make, and where
certain paths lead to which situation. I only worked with the Find slot to write this:

```
<line>.+?</line>\R
```

Another code I wrote on the Find slot for the "leads to" parts is this:

```
<line speaker="Leads.+?</line>\R
```

The next thing I did was to work with special cut-ins of the game. We decided to work on the most
iconic cut-ins, where are "Objection!", "Hold it!", and "Take that!" I originally wrote these
lines of codes on the Find slot to highlight all three, but I worked with one cut-in at a time:

**ORIGINAL FIND SLOT CODES FOR CUT-INS**
```
(Objection!)
```

```
(Hold it!)
```

```
(Take that!)
```

After these three codes above, I wrote the same code on the Replace slot below:

```
<cutIn>\1</cutIn>
```

One of my teammates, Reece, suggested that I should add more detail to the code denoting the
cut-ins. Here is what I wrote on the respective Find and Replace slots now:

**NEW FIND SLOT CODES FOR CUT-INS**

```
<cutIn>(Objection!)</cutIn>
```

```
<cutIn>(Hold it!)</cutIn>
```

```
<cutIn>(Take that!)</cutIn>
```

**NEW REPLACE SLOT CODES FOR CUT-INS**

```
<cutIn type="objection">\1</cutIn>
```

```
<cutIn type="holdIt">\1</cutIn>
```

```
<cutIn type="takeThat">\1</cutIn>
```

Lastly, I wrapped the entire transcript into an XML element. On the Find slot, I wrote:

```
(<title>.+)
```

And then, I wrote this on the Replace slot:

```
<xml>\R\1</xml>
```

The finishing touch was that I wrote a code on Git Bash to convert all TXT files into XML files:

```
for f in *.txt; do mv $f `basename $f .txt`.xml; done;
```

Though most of the XML is well-formed, some transcripts are written slightly different, leading
to some problems that I later fixed myself. For example, in the transcript to ***Turnabout Airlines: Part 1***,
there is a random Image Gallery line after the title, leading to an error where the XML element
comes after the Line element when it should not, so I manually fixed it myself by rewriting those
respective elements in their correct spots. In another transcript, ***The Adventure of the Unspeakable Story: Part 2***,
there is misplaced text inside the attribute for the speaker, so I manually fixed the respective attribute and line altogether,
making the transcript well-formed.