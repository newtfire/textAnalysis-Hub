<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="200"/>
    
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:variable name="color" select="'purple'"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
            <desc>SVG created from <xsl:apply-templates select="//info"/></desc>
            
            <g transform="translate(20 500)">
                
                <xsl:for-each select="descendant::para">
                    
                    <circle cx="{$x-spacer * position()}"
                        cy="{-250}" 
                        r="{@n * $y-spacer}"
                        fill="{$color}"
                        stroke="black"
                        stroke-width="{count(descendant::loc)}"
                    /> <!-- I made the stroke witdh the count of how many loc elements there are in the XML document.-->


                </xsl:for-each>
            </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>