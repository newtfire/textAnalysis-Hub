<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/smiley">
        <svg width="500" height="500"
            xmlns="http://www.w3.org/2000/svg">
            
            <!-- Face -->
            <circle cx="250" cy="250"
                r="{face/@radius}"
                fill="{face/@color}"
                stroke="black"
                stroke-width="4"/>
            
            <!-- Eyes -->
            <xsl:for-each select="eyes/eye">
                <circle cx="{@cx}" cy="{@cy}" r="{@r}" fill="black"/>
            </xsl:for-each>
            
            <!-- Mouth -->
            <path d="M180 300 Q250 350 320 300"
                fill="none"
                stroke="{mouth/@color}"
                stroke-width="5"/>
            
            <!-- Birthday Hat -->
            <xsl:for-each select="birthdayHat/hat">
                <polygon points="{@baseLeftX},{@baseY} {@baseRightX},{@baseY} {@topX},{@topY}"
                    fill="{@color}"
                    stroke="black"
                    stroke-width="3"/>
            </xsl:for-each>
            
            <!-- Pom-Pom -->
            <xsl:for-each select="birthdayHat/pom">
                <circle cx="{@cx}" cy="{@cy}" r="{@r}"
                    fill="{@color}" stroke="black" stroke-width="2"/>
            </xsl:for-each>
            
        </svg>
    </xsl:template>
</xsl:stylesheet>
   