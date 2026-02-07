<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="200"/>
    
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <g transform="translate(20 500)">
                <xsl:for-each select="descendant::para">
                   <!-- <xsl:variable name="count" select="count(descendant::num)"/>-->
                    <!--ebb: This is the first problem: In your source XML document, there are no
                    <num> elements that are descendants of <para>. You do have markup in there, but
                    you didn't select it to count. You have @num attributes on your para elements, but
                    they are just numbering the paragraphs and that probably isn't what you were interested in marking
                    So, I just renamed the variable. I made it so it counts **any** elements you marked 
                    inside the para element. LOOK back at your source XML now: there are no elements
                    marked inside para 2, so we won't see anything plotted there. 
                    .-->
                    <xsl:variable name="count" select="count(descendant::*)"/>
          
           
                    
           <!--         <rect rx="{$x-spacer * position()}"
                        ry="{-250}" 
                        r="{$count * $y-spacer}"
                        fill="rgb(20, {2* 50}, {2*20})"
                        stroke="black"
                        stroke-width="2"                    
                    />
            This rect element is I think adapted from one of the circle elements
            we were plotting in class! The rectangles aren't visible when you
            try to view the output file because SVG <rect> elements just don't have
            an @r attribute. (That's for the radius of a circle.)
            I was surprised to see that there's an rx and ry attribute, though, for
            a vertical corner radius. I think that's for making rounded corners!
            
            To basically plot a rect elememt, you need @x, @y (to define top left corner)
            and then a @height attribute and a @width attribute. So I'm just redoing this shape with 
            attributes that work. You'll see the SVG output now on the screen. 
           -->
                    <rect x="{$x-spacer * position()}"
                        y="-{$count * $y-spacer}" 
                        height="{$count * $y-spacer}"
                        width="100"
                        fill="blue"
                        stroke="black"
                        stroke-width="2"                    
                    />  
                    
                    
                </xsl:for-each>
            </g>
            
        </svg>
        
        
    </xsl:template>
    
</xsl:stylesheet>