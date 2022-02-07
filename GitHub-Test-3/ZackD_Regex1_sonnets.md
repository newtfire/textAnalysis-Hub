# Shakespeare Sonnets Regex

# Step 1:

To begin I started by cleaning up the document. First I deleted any unnecessary intro or conclusion to the Gutenberg document.

I chose to keep the extra spaces as of right now because they will prove to be useful for later searches.

They will be removed at the end.


# Step 2:

Because I plan to work in an inside out pattern, I begin by adding "line" tags to every line of the document.
```
^.+

Replace:
<line>\0</line>
```

# Step 3:

Next, I will remove the line tags from the roman numerals as they are not actually lines of poetry.

To do this search for a line tag followed two spaces, roman numerals, and then by another line tag.
```
<line>\s\s([IVXLC]+)</line>

Replace:
<sonnet number="\1">
```
The above insertion will use parentheses to capture the roman numerals and output it in a xml attribute.

# Step 4:

Step for is to add the end tag for the previous sonnet tag entered.
```
(</line>\n)\n

Replace:
\1</sonnet>
```

# Step 5:

Now we will be surrounding the every sonnet with a "sonnets" tag

For the method I used here, I will be checking the "dot matches all" box briefly for this and the following step.
```
<sonnet number="I">.+

Replace:
<sonnets>\0</sonnets>
```

# Step 6:

Step 6 is similar to step 5 in that I will be using "dot matches all" to surround the entire document with "xml" tags.
```
.+

Replace:
<xml>\0</xml>
```

# Step 7:

After this I manually added tags to the beginning 
```
<title> THE SONNETS </title>
<author> by William Shakespeare </author>
```

