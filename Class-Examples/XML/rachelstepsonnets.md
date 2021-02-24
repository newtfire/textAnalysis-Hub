Rachel Gerzevske: Sonnets Markdown Steps

1. Clear out the extra spaces before each line using the code sequence below. 

Find: ^\s+
Replace: Keep this line blank

2. Wrap each line of the file in a code block titles <line>.  

Find: ^.+
Replace: <line>\0</line>

3. Add <xml> to the top of the page and </xml> to the bottom of the page. 

4. Save the file as "clevertitlehere.xml", close, and open the new xml file. 

5. Find and isolate the Roman Numerals. They will need to be replaced with new lines of code. 

Find: <line>([IVLCX])+</line>
Replace: </sonnet>\n<sonnet number="\1">

**NOTE:** For some reason, only one part of the numeral was saved per line. I don't know what caused it, but if anyone can figure out why and correct me, I'd greatly appreciate it! That way, I won't have to manually type out roman numerals next time.

6. change the </sonnet> above the first sonnet to <sonnets>. Similarly, create another root just above the </xml> root at the bottom of the page and call it </sonnets>. 

7. You're done! go enjoy yourself! :D