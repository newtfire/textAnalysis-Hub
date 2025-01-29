<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Define Key to Remove Duplicates by 'loc' Attribute -->
    <xsl:key name="locations" match="location" use="@loc"/>
    
    <xsl:template match="/">
        <svg width="1000" height="900" viewBox="0 0 1000 900">
            <!-- Background -->
            <rect width="100%" height="100%" fill="#f4f4f9"/>
            
            <!-- Title Box -->
            <rect x="20" y="20" width="960" height="70" fill="#2C3E50" rx="10"/>
            <text x="50" y="60" font-family="Georgia" font-size="28" font-weight="bold" fill="white">
                <xsl:value-of select="/xml/meta/title"/>
            </text>
            
            <!-- Date -->
            <text x="50" y="110" font-family="Arial" font-size="16" fill="#34495E">
                <xsl:value-of select="/xml/meta/date"/>
            </text>
            
            <!-- Correction Breakdown Graph -->
            <rect x="150" y="150" width="700" height="300" fill="white" stroke="#BDC3C7" stroke-width="2" rx="10"/>
            <text x="170" y="170" font-family="Arial" font-size="16" font-weight="bold" fill="black">
                Corrections and Errors:
            </text>
            
            <!-- Count Variables -->
            <xsl:variable name="typoCount" select="count(//imp[@type='typo'])"/>
            <xsl:variable name="spellingCount" select="count(//imp[@type='spelling'])"/>
            <xsl:variable name="correctionCount" select="count(//imp[@corr])"/>
            <xsl:variable name="writingCount" select="count(//imp[@type='writing'])"/>
            <xsl:variable name="underlineCount" select="count(//imp[@type='underline'])"/>
            
            <!-- Graph Labels & Bars -->
            <xsl:for-each select="('typo', 'spelling', 'correction', 'writing', 'underline')">
                <xsl:variable name="type" select="."/>
                <xsl:variable name="count">
                    <xsl:choose>
                        <xsl:when test="$type='typo'"><xsl:value-of select="$typoCount"/></xsl:when>
                        <xsl:when test="$type='spelling'"><xsl:value-of select="$spellingCount"/></xsl:when>
                        <xsl:when test="$type='correction'"><xsl:value-of select="$correctionCount"/></xsl:when>
                        <xsl:when test="$type='writing'"><xsl:value-of select="$writingCount"/></xsl:when>
                        <xsl:when test="$type='underline'"><xsl:value-of select="$underlineCount"/></xsl:when>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:variable name="color">
                    <xsl:choose>
                        <xsl:when test="$type = 'typo'">#E74C3C</xsl:when>  <!-- Red -->
                        <xsl:when test="$type = 'spelling'">#3498DB</xsl:when>  <!-- Blue -->
                        <xsl:when test="$type = 'correction'">#27AE60</xsl:when>  <!-- Green -->
                        <xsl:when test="$type = 'writing'">#8E44AD</xsl:when>  <!-- Purple -->
                        <xsl:when test="$type = 'underline'">#F1C40F</xsl:when>  <!-- Yellow -->
                    </xsl:choose>
                </xsl:variable>
                
                <!-- Labels -->
                <text x="170" y="{200 + (position() * 40)}" font-family="Arial" font-size="14" fill="black">
                    <xsl:value-of select="upper-case($type)"/>
                </text>
                
                <!-- Bars -->
                <rect x="270" y="{185 + (position() * 40)}" width="{$count * 15}" height="20" fill="{$color}" rx="5"/>
                
                <!-- Count Display -->
                <text x="{275 + ($count * 15)}" y="{200 + (position() * 40)}" font-family="Arial" font-size="14" fill="black">
                    <xsl:value-of select="$count"/>
                </text>
            </xsl:for-each>
            
            <!-- Locations Mentioned Section (Extended & Without Duplicates) -->
            <rect x="150" y="480" width="700" height="350" fill="white" stroke="#BDC3C7" stroke-width="2" rx="10"/>
            <text x="170" y="500" font-family="Arial" font-size="16" font-weight="bold" fill="black">
                Locations Mentioned:
            </text>
            
            <!-- Unique Locations -->
            <xsl:for-each select="//location[generate-id() = generate-id(key('locations', @loc)[1])]">
                <xsl:variable name="index" select="position()"/>
                
                <!-- Location Name -->
                <text x="170" y="{520 + ($index * 25)}" font-family="Arial" font-size="14" fill="black">
                    <xsl:value-of select="."/> 
                    (<xsl:value-of select="@loc"/>)
                </text>
            </xsl:for-each>
            
        </svg>
    </xsl:template>
</xsl:stylesheet>
