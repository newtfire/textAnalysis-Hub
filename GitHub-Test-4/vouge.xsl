<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/materials">
        
        <svg width="900" height="500" viewBox="0 0 900 500">
            
            <!-- title -->
            <text x="450" y="30" text-anchor="middle" font-size="18">
                Vogue Materials by Frequency
            </text>
            
            <!-- scale note -->
            <text x="250" y="50" font-size="10">
                Bar length represents total count
            </text>
            
            <!-- bars -->
            <xsl:for-each select="material">
                
                <!-- variables -->
                <xsl:variable name="y" select="80 + (position() - 1) * 35"/>
                <xsl:variable name="barWidth" select="count * 10"/>
                
                <!-- bar -->
                <rect x="250"
                    y="{$y}"
                    width="{$barWidth}"
                    height="20"
                    fill="#c77dff"
                    stroke="black"/>
                
                <!-- category label -->
                <text x="240"
                    y="{$y + 15}"
                    text-anchor="end"
                    font-size="11">
                    <xsl:value-of select="category"/>
                </text>
                
                <!-- count -->
                <text x="{250 + $barWidth + 5}"
                    y="{$y + 15}"
                    font-size="10">
                    <xsl:value-of select="count"/>
                </text>
                
                <!-- years -->
                <text x="650"
                    y="{$y + 15}"
                    font-size="10"
                    fill="gray">
                    <xsl:value-of select="years"/>
                </text>
                
            </xsl:for-each>
            
        </svg>
    </xsl:template>
    
</xsl:stylesheet>
