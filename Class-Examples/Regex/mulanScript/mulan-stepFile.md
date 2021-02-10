## Regex steps for converting the *Mulan* screenplay from text to XML:
 
1. Find `&` `<` `>` (ebb: not found because I removed some weird stray `<b>` elements throughout)
2. Find `\n{3,}`
   Replace with: `\n\n`  (just one location)
   
3. Let's wrap everything that's separated by two newlines in `<sp>....</sp>` elements. These span across lines, so turn on "Dot matches all."
Find: `^(.+?)(\n\n)`
Replace with: `<sp>\1</sp>\2`

4. Now we fine-tune the markup. Wrap all stage directions marked with square brackets in `<stage>....</stage>`. We have to escape the square brackets. Keep "Dot matches all" turned on because these span across multiple lines sometimes. We'll throw away those square brackets, so don't include them in capturing groups:

Find: `\[(.+?)\]`   (769 of these)
Replace with: `<stage>\1</stage>`

5. Remove `<sp>` elements when they ONLY have stage directions inside. With Dot matches all turned ON, we noticed we needed to exclude angle brackets from the search so this wouldn't match across multiple <sp> elements (which we could see happening at the top of the file):

Find: `<sp>(<stage>[^<]+?</stage>)</sp>` (found 173)
Replace with: `\1`

6. Add `<speaker>` tags, noting where to find speaker information (before the first `:` in a speech). (We decided to lose the "pseudomarkup" colon in our replace, since we're adding clear markup). TURN OFF Dot matches all" because this match will go across speeches otherwise, and because of all the stage directions, we can't just exclude angle brackets before colons.

Find: `(<sp>)(.+?):`  Finds 534 matches
Replace with: `\1<speaker>\2</speaker>`

This will NOT QUITE match all the speakers, but we can find the rest by other means later. (It's better to not quite match everything than to create matches that are too greedy and result in XML that is not well-formed.)

7. Wrap a root element and save as XML. Close and reopen. 

8. We had to manually remove one misplaced `<speaker>` element here:
`
<sp><speaker><stage>order of events during the last repeat of the chorus</speaker>
`
(For when we learn XPath: we can look for `<sp>` elements that are missing an expected `<speaker>` element nested inside. We will do an XPath search for `//sp[not(speaker)]` and find 19 speeches that need speaker tags.

Tidying up: Changed the tagging at the top by hand (added `<source>` and <`sourceLink>` elements, removed extra square bracket in source info near top, and pretty-printed the well-formed XML.




