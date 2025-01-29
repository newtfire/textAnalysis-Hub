<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
       
        <xsl:variable name="x-spacer" select="300"/>
        <xsl:variable name="y-base" select="300"/>
        <xsl:variable name="circle-radius" select="50"/>
        <xsl:variable name="rect-size" select="100"/>
        <xsl:variable name="polygon-offset" select="100"/>
        
        <xsl:output method="xml" indent="yes"/>
        
        <xsl:template match="/">
            <svg width="1400" height="600">
                <desc>SVG created from XML data, showing various 'whatsIt' counts.</desc>
                
                <!-- title -->
                <text x="50" y="50" font-size="28" font-family="Arial" fill="black">
                    "whatsIt" Counts
                </text>
                
                <!-- visualization -->
                <g transform="translate(50, 300)">
                    <xsl:for-each select="//blob">
                        <circle cx="{$x-spacer * position()}" 
                            cy="-100" 
                            r="{$circle-radius}" 
                            fill="purple" 
                            stroke="black" 
                            stroke-width="4">
                            <title>MagicEgg Count: <xsl:value-of select="count(special[@whatsIt='magicEgg'])"/></title>
                        </circle>
                        
                        <rect x="{$x-spacer * position() + 170}" 
                            y="-150" 
                            width="{$rect-size}" 
                            height="{$rect-size}" 
                            fill="blue" 
                            stroke="black" 
                            stroke-width="4">
                            <title>PowerUp Count: <xsl:value-of select="count(special[@whatsIt='powerUp'])"/></title>
                        </rect>
                        
                        <polygon points="{concat($x-spacer * position() + 400, ',-100 ', 
                            $x-spacer * position() + 350, ',-200 ', 
                            $x-spacer * position() + 450, ',-200')}"
                            fill="green" 
                            stroke="black" 
                            stroke-width="4">
                            <title>RocketShip Count: <xsl:value-of select="count(special[@whatsIt='rocketShip'])"/></title>
                        </polygon>
                    </xsl:for-each>
                </g>
                
                <!-- legend -->
                <g transform="translate(50, 450)">
                    <text x="0" y="0" font-size="18" font-family="Arial" fill="black">Legend:</text>
                    
                    <!-- legend: circle -->
                    <circle cx="20" cy="30" r="15" fill="purple" stroke="black" stroke-width="2"/>
                    <text x="40" y="35" font-size="14" font-family="Arial" fill="black">MagicEgg</text>
                    
                    <!-- legend: rectangle -->
                    <rect x="10" y="50" width="30" height="30" fill="blue" stroke="black" stroke-width="2"/>
                    <text x="40" y="65" font-size="14" font-family="Arial" fill="black">PowerUp</text>
                    
                    <!-- legend: polygon -->
                    <polygon points="20,100 10,130 30,130" fill="green" stroke="black" stroke-width="2"/>
                    <text x="40" y="115" font-size="14" font-family="Arial" fill="black">RocketShip</text>
                </g>
            </svg>
        </xsl:template>
    </xsl:stylesheet>