# Giving Tags to .txt File

First, like usual I found an eliminated all <, >, and & that would ruin our xml.
Fortunately, there was nothing to be removed and I could immediately start on the process.

Find 
```
(^.+)
```
Replace
```
<line>\1</line>
```
This wraps every sentence with a line tag. 

then I found that every character was followed by a colon.

Find 
```
<line>(.+): 
```
the dot gets rid of a space 

Replace 
```
<line><character>\1</character>
```
This keeps the line tag intact when I find/replace.

Next, dialogue

Find 
```
</character>(.+)</line>
```
Replace 
```
</character><dialogue>\1</dialogue></line>
```
Now all I have left is stage directions and clean up.

I saw that the stage directions were wrapped in square brackets. 

Find 
```
\[(.+?)\]
```
Replace 
```
<stage>\1</stage>
```
Now I wrapped the whole thing in xml and fixed the beginning and end with and intro and credits tag.
