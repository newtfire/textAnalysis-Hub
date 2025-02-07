<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="600" height="600" style="background-color:#f8f8f8;">
            <line x1="50" y1="300" x2="550" y2="300" stroke="black" stroke-width="2"/>
            <line x1="300" y1="50" x2="300" y2="550" stroke="black" stroke-width="2"/>
            <xsl:apply-templates select="xml/nr/ing/ing"/>
        </svg>
    </xsl:template>
    
    <xsl:template match="ing">
        <xsl:variable name="index" select="position()"/>
        <xsl:variable name="x" select="$index * 80 + 60"/>
        <xsl:variable name="y" select="300 - (@quant * 100)"/>
        <xsl:variable name="size" select="@quant * 30"/>
        
        <!-- Color based on ingredient type -->
        <xsl:variable name="color">
            <xsl:choose>
                <xsl:when test="contains(., 'butter')">gold</xsl:when>
                <xsl:when test="contains(., 'sugar')">lightgray</xsl:when>
                <xsl:when test="contains(., 'flour')">wheat</xsl:when>
                <xsl:when test="contains(., 'eggs')">orange</xsl:when>
                <xsl:otherwise>lightblue</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <circle cx="{$x}" cy="{$y}" r="{$size}" fill="{$color}" stroke="black" stroke-width="2" opacity="0.8"/>
        <text x="{$x}" y="{$y - $size - 10}" font-size="12" text-anchor="middle" fill="black">
            <xsl:value-of select="."/>
        </text>
    </xsl:template>
</xsl:stylesheet>
