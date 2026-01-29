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
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            
           <g transform="translate(50 650)">
            
            <xsl:for-each select="descendant::blob">
                
                <xsl:variable name="count" select="count(descendant::special[@whatsIt='magicEgg'])"/>
                
                
                <circle cx="{$x-spacer * position()}"
                    cy="{-250}" 
                    r="{$count * $y-spacer}"
                    fill="rgb({$count*35}, {$count* 50}, {$count*40})"
                    stroke="black"
                    stroke-width="2"
                />
                
            </xsl:for-each>
               
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>