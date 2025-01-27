<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="200"/>
    
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg width="100%">
            <g transform="translate(20 500)">
                <xsl:for-each select="//stats">
                    <circle cx="{$x-spacer * position()}"
                        cy="{-250}"
                        r="{descendant::points//@num * 10}"
                        fill="gray"
                        stroke="black"
                        stroke-width="1"/>
                </xsl:for-each>
                
            </g>   
        </svg>
        
        
    </xsl:template>
    
</xsl:stylesheet>