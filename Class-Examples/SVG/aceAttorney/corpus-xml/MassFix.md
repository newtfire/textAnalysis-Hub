# Checking Runthrough
This will chronicle the errors found in the XML uploaded in this Git Push: https://github.com/rcc5418/CourtRecord/commit/94560c5292722b02df0baffc3b4d3213117e476a

First, I gave attributes to the \<cutIn> elements by find/replacing in files:
```
<cutIn>Take that!</cutIn>
->
<cutIn type = "takeThat">Take that!</cutIn>
```
```
<cutIn>Hold it!</cutIn>
->
<cutIn type="holdIt">Hold it!</cutIn>
```
```
<cutIn>Objection!</cutIn>
->
<cutIn type="objection">Objection!</cutIn>
```


- In Turnabout Time Traveler Part 4, the \<xml> element as well as the text at the beginning was incorrect. The document was missing a \</xml> as well.
```
<line>Turnabout Time Traveler</line><xml>
<title>Image Gallery</title>
->
<xml>
<title>Turnabout Time Traveler</title>
```

- This error repeated in several other documents. I can find/replace them in all the files:
```
<line>(.+)</line><xml>\R<title>Image Gallery</title>\R
->
<xml>\R<title>\1</title>\R
```


- In Turnabout Succession Part 4, a speaker attribute is deformed:
```
<line speaker="After moving anywhere <thought>7 years ago</thought>">Phoenix:</line>
->
<line speaker="Phoenix"><thought>7 years ago</thought></line>
```
- This error will also appear more, I'll handle it the same way each time.
- Sometimes, an extra line will appear that isn't spoken by any character, but rather an artifact ofr the transcripts guide-like text:
```
<line speaker="Solitary Cell 13, after clearing all Talk options with Kristoph, Vera, Brushel, and Valant <thought>Present Day</thought>">Guard:</line>
```
- When something like this appears, I'll just delete it. In fact, I can just find/replace in files with this, and replace it with nothing:
```
<line speaker="After.+\R
#I can do this because there's no character whose name begins with 'After'
```
- There are more with unique text at the beginning, but I'll just delete them as I find them.
 - Another error I could identify involved the pair of characters Cecil and Petal:
```
<line speaker="Cecil &amp; Petal <thought>Cecil</thought>">
```
 - I can find and replace this pattern with just the character who is speaking:
```
Cecil &amp; Petal <thought>Cecil</thought>
->
Cecil

Cecil &amp; Petal <thought>Petal</thought>
->
Petal
```
 - A similar phenomenon occurs with a group of Vigilante characters, which the transcript identifies in parantheses, incorrectly put into a though element:
```
<line speaker="Vigilante <thought>Boistrum</thought>">You can't squirm your way out of this!</line>
```
```
Vigilante <thought>Boistrum</thought>
->
Vigilante* Boistrum
```
 - I repeated this pattern for the other vigilantes as well, Lottalance, Lyewood, Balmung, Shakey, Servius, Foxy, Treddon, Dzibilchaltunchunchucmil, and Wordsmith. IN addition, there was one time when Servius/Treddon spoke in unison, so I had to individually replace that one.

After making sure each XML document gives me the green square, I combined them with TXTCollector, then deleted every \<xml> and \</xml> before wrapping the entire doc with a new \<xml> element. Interestingly, there were a couple \<line> elements that had some of their endings deleted, but by careful searching I was able to find them and restore their contents by consulting our .txt files.
I believe the root cause of this was the colons that appeared in the lines...