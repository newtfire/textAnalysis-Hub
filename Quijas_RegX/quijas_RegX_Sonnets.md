# Regex Sonnets

1. ^\s\s
<p> This trims off extra space </p>

2. ^.+?$| ^[^<]+?$
<p> To select all </p> 

Replaced with <line> \0 <\line> 
<p> This wraps everything in a line </p> 

 
3. <line>\s*([IVXLCD]+)\s*<\/line>
<p> To isolate the numbers. I had to add the line so I can look inside.  </p>

 Replaced with </sonnet> <sonnet n="\1">
 <p> wrapped the numbers with sonnet </P>
 
 4. Wrote in title and author. Selected pretty print. 




