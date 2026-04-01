<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    
    <xsl:variable name="x-spacer" select="200"/>
    
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            <g>
                <rect width="100%" height="100%" fill="pink"></rect>
            <text x="180" y="515" fill="blue" font-size="14">Essay.html to Bar Graph</text>
                <text x="350" y="300" font-size="25">X</text>
                <text x="200" y="100" font-size="25">Y</text>
                <text x="200" y="275" font-size="18">(0,0)</text>
                <text x="300" y="25" font-size="18">Types of Words Said in my Essay in DIGIT 100</text>
           
            </g>
            <text x="300" y="275" fill="black" font-size="17">The</text>
            <text x="400" y="275" fill="black" font-size="17">This</text>
                
            <xsl:variable name="text"
                select="lower-case(string(//xhtml:body))"/>
            
            <!-- Count "the" -->
            <xsl:variable name="theCount"
                select="count(tokenize($text, '\W+')[.='the'])"/>
            
            <!-- Rectangle -->
            <rect width="50"
                height="{$theCount * 20}"
                x="290"
                y="70"
                fill="green"/>
            <xsl:variable name="text"
                select="lower-case(string(//xhtml:body))"/>
            
            <!-- Count "the" -->
            <xsl:variable name="theCount"
                select="count(tokenize($text, '\W+')[.='this'])"/>
            
            <!-- Rectangle -->
            <rect width="50"
                height="{$theCount * 20}"
                x="390"
                y="210"
                fill="yellow"/>
            
            <line x1="0" y1="250" x2="500" y2="250" stroke="black" stroke-width="4"/>
            <line x1="250" y1="0" x2="250" y2="500" stroke="black" stroke-width="4"/>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>