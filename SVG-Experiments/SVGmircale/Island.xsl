<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg width="100%" height="100%">
            
            <!-- Y axis -->
            <line x1="50" y1="50" x2="50" y2="450"
                stroke="black" stroke-width="4"/>
            
            <!-- X axis -->
            <line x1="50" y1="450" x2="450" y2="450"
                stroke="black" stroke-width="4"/>
            
            <text x="250" y="40" text-anchor="middle" font-size="20">
                The areas in square miles of three Polynesian islands
            </text>
            
            <!-- Draw circles from XML -->
            <xsl:for-each select="islands/island">
                <circle cx="200"
                    cy="{@cy}"
                    r="{@r}"
                    fill="{@fill}"
                    stroke="black"
                    stroke-width="4"/>
                
                <text x="200" y="{@cy + 5}"
                    font-size="14"
                    fill="orange"
                    text-anchor="middle">
                    <xsl:value-of select="@name"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="@area"/> sq mi
                </text>
            </xsl:for-each>
            
            <animateTransform
                attributeName="transform"
                type="translate"
                values="-5 0; 5 0; -5 0; 5 0; 0 0"
                dur="0.5s"
                repeatCount="indefinite"/>
        </svg>   
    </xsl:template>
</xsl:stylesheet>