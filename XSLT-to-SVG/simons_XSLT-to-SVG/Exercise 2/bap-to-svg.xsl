<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:key name="locations" match="location" use="@loc"/>

    <xsl:template match="/">
        
        <svg width="700" height="600">
            
            <rect x="70" y="50" width="600" height="520" fill="#f4f4f9" stroke="black"/>
            
            <text x="100" y="100" font-family="Times New Roman" font-weight="bold" font-size="24">
                Letter: <xsl:value-of select="/xml/meta/title"/>
            </text>
            
            <text x="100" y="150" font-family="Times New Roman" font-weight="bold" font-size="18">
                Locations (in order of appearance):
            </text>
            
            <xsl:for-each select="//location[generate-id() = generate-id(key('locations', @loc)[1])]">
                <xsl:variable name="y-spacer" select="position()"/>
                
                <text x="100" y="{160 + ($y-spacer*20)}" font-family="Times New Roman" font-size="14">
                    • <xsl:value-of select="@loc"/>
                </text>
            </xsl:for-each>
            
        </svg>
        
    </xsl:template>
    
</xsl:stylesheet>