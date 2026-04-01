<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="200"/>
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg width="100%" height="800">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <!-- navy background -->
            <rect width="100%" height="100%" fill="rgb(0, 0, 128)"/>
            
            <!-- header -->
            <text x="50%" y="500"
                font-family="Arial"
                font-size="30"
                fill="rgb(255, 255, 255)">
                Way to transform that XML!
                <!--<animate attributeName="x"
                    from="0"
                    to="300"
                    dur="5s"
                    repeatCount="indefinite"/>-->
                <!--I could not figure out how to animate this at all but i tried-->
            </text>
            
            <!-- stars group -->
            <g transform="translate(100 200)">
                <xsl:for-each select="/xml/blob">
                    
                    <xsl:variable name="rocketCount"
                        select="count(descendant::special[@whatsIt='rocketShip'])"/>
                    
                    <g transform="translate({position() * $x-spacer}, -200)">
                        <polygon
                            points="50,0 61,35 98,35 68,57 79,91 50,70 21,91 32,57 2,35 39,35"
                            fill="rgb(255, 255, 0)"
                            stroke="rgb(0, 0, 0)"
                            stroke-width="2"
                            transform="scale({if ($rocketCount = 0) then 1 else $rocketCount})"/>
                    </g>
                    
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>