# Ross Regex Autotagging Exercise 2 (GitHub Test)

1. Find and replace empty spaces. Removes the empty spaces at the beginning of each line.
    - Find: ```^[ ]+```
    - Replace:```(blank-space)```

1. Find the ```sonnets```
    - Find: ```<line>([IVXLC]+)</line>``` 
    - Replace: ```</sonnet>\n<sonnet number="\1">```

1. Delete Empty Lines
    - Find: ```\n\n+```
    - Replace: ```\n```

1. To indent everything and format it to XML, I did ```CMD+Shift+P```

```<xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="paragraph">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="QuestEvent">
       <span class="quest-event">
           <xsl:apply-templates/>
       </span>
    </xsl:template>