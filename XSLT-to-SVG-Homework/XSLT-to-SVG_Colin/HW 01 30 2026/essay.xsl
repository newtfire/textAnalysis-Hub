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
                <rect width="675"
                    height="500"
                    x="0"
                    y="0"
                    fill="white"></rect>
              <!--  LEGEND-->
                <rect width="200"
                    height="110"
                    x="20"
                    y="350"
                    fill="black"></rect>
                <line x1="100" y1="350" x2="100" y2="460" stroke="white" stroke-width="4"/>
                <text x="70" y="340" fill="black" font-size="25">LEGEND</text>
                <text x="35" y="370" fill="white" font-size="20">Word</text>
                <text x="117" y="368" fill="white" font-size="15"># of times said</text>
                <text x="180" y="515" fill="blue" font-size="14">Essay.html to Bar Graph</text>
                <text x="450" y="300" font-size="25">X</text>
                <text x="200" y="120" font-size="25">Y</text>
                <text x="200" y="275" font-size="18">(0,0)</text>
                <text x="285" y="25" font-size="18">Types of Words Said in my Essay in DIGIT 100</text>
                <text x="35" y="390" fill="green" font-size="20">The</text>
                <text x="35" y="410" fill="yellow" font-size="20">This</text>
                <text x="35" y="430" fill="purple" font-size="20">And</text>

                <text x="35" y="450" fill="red" font-size="20">It</text>
                <text x="117" y="389" fill="white" font-size="18">9</text>
                <text x="117" y="407" fill="white" font-size="18">2</text>

                <text x="117" y="428" fill="white" font-size="18">6</text> 
                <text x="117" y="447" fill="white" font-size="18">5</text> </g>
            <text x="300" y="275" fill="black" font-size="17">The</text>
            <text x="400" y="275" fill="black" font-size="17">This</text>
            <text x="500" y="275" fill="black" font-size="17">And</text>
            <text x="610" y="275" fill="black" font-size="17">It</text>
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
            
            <!-- Count "this" -->
            <xsl:variable name="theCount"
                select="count(tokenize($text, '\W+')[.='this'])"/>
            
            <!-- Rectangle -->
            <rect width="50"
                height="{$theCount * 20}"
                x="390"
                y="210"
                fill="yellow"/>
            <!-- Count "and" -->
            <xsl:variable name="theCount"
                select="count(tokenize($text, '\W+')[.='and'])"/>
            
            <!-- Rectangle -->
            <rect width="50"
                height="{$theCount * 20}"
                x="490"
                y="130"
                fill="purple"/>
            <!-- Count "it" -->
            <xsl:variable name="theCount"
                select="count(tokenize($text, '\W+')[.='it'])"/>
            
            <!-- Rectangle -->
            <rect width="50"
                height="{$theCount * 20}"
                x="590"
                y="150"
                fill="red"/>
            
            <line x1="0" y1="250" x2="675" y2="250" stroke="black" stroke-width="4"/>
            <line x1="250" y1="0" x2="250" y2="500" stroke="black" stroke-width="4"/>
            <desc>animating</desc>
            <text x="900" y="100" fill="black" font-size="20"></text>
            <circle cx="950" cy="150" r="40" fill="orange">
                <animate
                    attributeName="cx"
                    begin="0s"
                    dur="3s"
                    from="950"
                    to="1100"
                    repeatCount="indefinite"
                    
                />
                <animate
                    attributeName="cy"
                    begin="0s"
                    dur="3s"
                    from="150"
                    to="400"
                    repeatCount="indefinite"
                    
                />
                <!-- COLOR CHANGE -->
                <animate
                    attributeName="fill"
                    begin="0s"
                    dur="3s"
                    values="red; orange; yellow; green; blue"
                    keyTimes="0; 0.25; 0.5; 0.75; 1"
                    repeatCount="indefinite"
                />
            </circle>
            <text x="700" y="50" fill="black" font-size="30">I Made This Circle Change Color With SVG + XSLT</text>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>