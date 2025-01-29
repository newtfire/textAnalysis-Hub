<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="100"/>
    
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg width="100%">
            <g transform="translate(20 500)">
                <line x1="0" y1="0" x2="0" y2="-500"/>
                <line x1="0" y1="0" x2="500" y2=""/>
                <xsl:for-each select="//stat">
                    <rect x="{$x-spacer * position()}"
                        y="{0}"
                        width="50"
                        height="{descendant::points//@num * 10}"
                        fill="gray"
                        stroke="black"
                        stroke-width="1"/>
                </xsl:for-each>
                
            </g>   
        </svg>
        
        
    </xsl:template>
    
</xsl:stylesheet>