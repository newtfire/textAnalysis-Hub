<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg"
            width="500" height="400">
            
            <!-- Background -->
            <rect x="0" y="0" width="500" height="400" fill="#f5f5f5"/>
            
            <!-- Title -->
            <text x="250" y="30"
                text-anchor="middle"
                font-size="20"
                fill="black">
                Monthly Sales
            </text>
            
            <!-- Bars -->
            <xsl:for-each select="sales/month">
                <xsl:variable name="xPos" select="position() * 90"/>
                <xsl:variable name="barHeight" select="@value"/>
                
                <!-- Bar -->
                <rect
                    x="{$xPos}"
                    y="{350 - $barHeight}"
                    width="50"
                    height="{$barHeight}"
                    fill="steelblue"/>
                
                <!-- Label -->
                <text
                    x="{$xPos + 25}"
                    y="370"
                    text-anchor="middle"
                    font-size="12">
                    <xsl:value-of select="@name"/>
                </text>
            </xsl:for-each>
            
        </svg>
    </xsl:template>
</xsl:stylesheet>