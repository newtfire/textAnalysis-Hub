<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="250"/>
    
    <xsl:variable name="y-spacer" select="50"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        
       <!-- <desc>Pokemon SVG movesets</desc>-->
     <!--   <g transform="translate(50,600)">-->
        <svg width="100%" height="150%">
            <g transform="translate (250 50)">
            <xsl:for-each select="descendant::move">
                <xsl:variable name="count" select="(count(category))"/>
                <rect x="{$x-spacer}" 
                    y="{$y-spacer*position()}" 
                    width="600" 
                    height="250" 
                    fill="blue" 
                    stroke="red" 
                    stroke-width="5"/>
                
                
                <!--ebb: Ray, you need to look up how an SVG rect element is drawn. You are missing 
                    a crucial attribute to make any rectangles plot at all! Your rectangles have no height.
                    https://www.w3schools.com/graphics/svg_rect.asp 
                    ->-->
             
             
            </xsl:for-each>
                //rs
        </g>
        </svg>
        
    </xsl:template>
</xsl:stylesheet>