<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="1.0">
    
    <!--
        This XSLT adapts Dr.Bs example. It compares 
        magicEgg specials with all other specials inside each blob.
        MagicEggs are circles and other specials are rectangles.
        I was unsure how best to scale the shapes, so I used fixed spacing.
    -->
    
    <xsl:variable name="x-spacer" select="200"/>
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg width="100%" height="600" viewBox="0 0 800 600">
            
            <desc>SVG created from <xsl:value-of select="//title"/></desc>
            
            <g transform="translate(20 500)">
                
                <xsl:for-each select="descendant::blob">
                    
                    <xsl:variable name="magicEggs"
                        select="count(descendant::special[@whatsIt='magicEgg'])"/>
                    
                    <xsl:variable name="otherSpecials"
                        select="count(descendant::special[not(@whatsIt='magicEgg')])"/>
                    
                  
                    <circle
                        cx="{$x-spacer * position()}"
                        cy="-250"
                        r="{$magicEggs * $y-spacer}"
                        fill="rgb(120, 0, 160)"
                        stroke="black"
                        stroke-width="2"/>
                    
                   
                    <rect
                        x="{$x-spacer * position() - 15}"
                        y="-200"
                        width="{$otherSpecials * 6}"
                        height="{$otherSpecials * 6}"
                        fill="orange"
                        stroke="black"
                        stroke-width="2"/>
                    
                </xsl:for-each>
                
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>

