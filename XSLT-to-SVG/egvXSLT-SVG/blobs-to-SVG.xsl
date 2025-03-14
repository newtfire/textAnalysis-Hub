<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    

    <xsl:variable name="x-spacer" select="200"/>

    
    <xsl:variable name="y-spacer" select="40"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>


           <g transform="translate(20 500)">

            
            <xsl:for-each select="descendant::blob">

                <circle cx="{$x-spacer * position()}"

                    cy="{-250}" 

                    r="100"
                    fill="white"
                    stroke="black"
                    stroke-width="3"
                />

                <g transform="rotate(-{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer})">
                <line x1="{$x-spacer * position()}"
                    y1="{-250}" 
                    x2="{$x-spacer * position()}"
                    y2="{-350}"
      
                    stroke="black"
                    stroke-width="10"
                />
                </g>
 
            </xsl:for-each> 
           </g>
        </svg>
       <!--I can't figure out how to add axes :( -->
    </xsl:template>
    
 
</xsl:stylesheet>