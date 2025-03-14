<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="200"/>
    <xsl:variable name="y-spacer" select="10"/>
    <xsl:variable name="grid-spacer" select="-100"/>
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg width="100%" height="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <g transform="translate(20 500)">
                <xsl:for-each select="descendant::blob">

                    <xsl:variable name="magicEgg" select="count(descendant::special[@whatsIt='magicEgg'])"/>
                    <xsl:variable name="powerUp" select="count(descendant::special[@whatsIt='powerUp'])"/>
                    <xsl:variable name="rocketShip" select="count(descendant::special[@whatsIt='RocketShip'])"/>
                    
                    <circle cx="{$x-spacer * position()}"
                        cy="{-100}" 
                        r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                        fill="rgb(220, 0, 222)"
                        stroke="black"
                        stroke-width="2" />    

                    <rect x="{$x-spacer * position()}"
                        y="{-200}"
                        width="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"
                        height="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"
                        fill="rgb(123, 0, 202)"
                        stroke="black"
                        stroke-width="2" />
                    
                    <ellipse cx="{$x-spacer * position()}"
                        cy="{-300}"
                        rx="{count(descendant::special[@whatsIt='RocketShip']) * $y-spacer}"
                        ry="{count(descendant::special[@whatsIt='RocketShip']) * $y-spacer}"
                        fill="rgb(52, 63 52)"
                        stroke="black"
                        stroke-width="2" />
                    
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>