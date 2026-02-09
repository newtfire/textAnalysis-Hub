<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:variable name="x-spacer" select="250"/>
    <xsl:variable name="y-origin" select="500"/>
    
    <xsl:template match="/">
        <svg width="1000" height="600" viewBox="0 0 1000 600">
            
            <g transform="translate(50, 0)">
                <xsl:for-each select="descendant::blob">
                    <xsl:variable name="eggCount" select="count(descendant::special[@whatsIt='magicEgg'])"/>
                    
                    <xsl:variable name="redValue" select="position() * 60"/>
                    
                    <ellipse cx="{position() * $x-spacer - 100}" 
                        cy="{$y-origin - ($eggCount * 40)}" 
                        rx="{$eggCount * 15}" 
                        ry="{$eggCount * 22}" 
                        fill="rgb({$redValue}, 120, 200)" 
                        stroke="black" 
                        stroke-width="2" />
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>