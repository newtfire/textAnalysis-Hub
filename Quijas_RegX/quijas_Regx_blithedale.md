# Regex Blithedale

1. ^\s\s
<p> This trims off extra space </p>

2. ^.+?$| ^[^<]+?$
<p> To select all </p> 

Replaced with <p> \0 <\\p> 
<p> This wraps everything in a line </p> 

 
3. <p>\s*([IVX]+)\s*<\/p>
<p> To isolate the numbers. I had to add the <p>  so I can look inside.  </p>

 I tried to wrap it in <chapter> but this did not work. 
 
 4. <p>\s*Title:\s*(.*?)<\/p>
<p>\s*Title:\s*(.*?)\s*<\/p> both did not work . 

 This did not find the title.  the \s* is supposed to allow white space before or after the title. <\/p> is suppose to replace the <\p> with what I wanted to replace it with. 

