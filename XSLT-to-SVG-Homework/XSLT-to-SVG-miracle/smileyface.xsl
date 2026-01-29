<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg"
            width="500" height="500"
            viewBox="0 0 500 500">
            
            <!-- Face -->
            <circle cx="250" cy="250"
                r="{smiley/face/@radius}"
                fill="{smiley/face/@color}"
                stroke="red"
                stroke-width="4"/>
            
            <!-- Eyes -->
            <xsl:for-each select="smiley/eyes/eye">
                <circle cx="{@cx}" cy="{@cy}" r="{@r}" fill="blue"/>
            </xsl:for-each>
            
            <!-- Mouth -->
            <path d="M 150 280 Q 250 360 350 280"
                stroke="{smiley/mouth/@color}"
                stroke-width="6"
                fill="none"/>
            
            
        </svg>
    </xsl:template>    
</xsl:stylesheet>