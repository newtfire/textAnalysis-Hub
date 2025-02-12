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
                    r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"

                    cy="{-50}" 
                    r="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}"
                    fill="green"
                    stroke="black"
                    stroke-width="2"
                />
                <circle cx="{$x-spacer * position()}"
                    cy="{-350}" 
                    r="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"

                    fill="purple"
                    stroke="black"
                    stroke-width="2"

                />

                <circle cx="{$x-spacer * position()}"
                    cy="{-200}" 
                    r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                    fill="pink"
                    stroke="black"
                    stroke-width="2"
                />

            </xsl:for-each>
           </g>
        </svg>
       <!--I can't figure out how to add axes :( -->
    </xsl:template>
    
 
</xsl:stylesheet>