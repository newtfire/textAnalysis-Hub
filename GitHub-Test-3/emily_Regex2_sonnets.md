# Regex  Assignment 2
## Emily Wargo
The first thing I had to do to the sonnet  was seperate each individual line :
```
Find: .+
Replace: <line>\0</line>
```
Next, I wanted to find all of the sonnet titles and put `<sonnet>` tags around them.I used the characters `[IVXLC]` so it could recognize the letters as roman numerals: 
```
Find: <line>\s.([IVXLC]+)</line>
Replace:<sonnet>\1</sonnet>
```
Lastly, I wanted to add a "number" attribute to each of the `<sonnet>` tags so that the number is equal to that sonnets's roman numera:  
```
Find: (<sonnet>)([IVXLC]+)
Replace:\1 number="\2"
```
I also added a `<root>` ag to the full XML file so it was in its correct form.
The outcome looked like this:
```
<root>
    <sonnet ="IV">    </sonnet>
        <line>    </line>
</root>
```

