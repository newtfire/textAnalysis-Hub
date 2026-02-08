<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math" version="1.0">

    <!--
        This XSLT adapts Dr.Bs example. It compares 
        magicEgg specials with all other specials inside each blob.
        MagicEggs are circles and other specials are rectangles.
        I was unsure how best to scale the shapes, so I used fixed spacing.
    -->

    <xsl:variable name="x-spacer" select="200"/>
    <xsl:variable name="y-spacer" select="10"/>

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <svg width="100%" height="600" viewBox="0 0 800 600">

            <desc>SVG created from <xsl:value-of select="//title"/></desc>

            <g transform="translate(20 500)">
                <line x1="0" y1="0" x2="850" y2="0" stroke="black"/>
                <line x1="0" y1="0" x2="0" y2="-450" stroke="black"/>
                
                <g id="legend" transform="translate(500 -450)">
                    <text x="0" y="0" font-size="14" font-weight="bold">Legend</text>
                    
                    <circle cx="10" cy="20" r="6" fill="rgb(120,0,200)" stroke="black"/>
                    <text x="25" y="25" font-size="12">MagicEgg specials</text>
                    
                    <rect x="4" y="35" width="12" height="12" fill="rgb(255,180,0)" stroke="black"/>
                    <text x="25" y="46" font-size="12">Other specials</text>
                </g>
                
                <xsl:for-each select="descendant::blob">

                    <xsl:variable name="magicEggs"
                        select="count(descendant::special[@whatsIt = 'magicEgg'])"/>

                    <xsl:variable name="otherSpecials"
                        select="count(descendant::special[not(@whatsIt = 'magicEgg')])"/>

                    <xsl:variable name="y-pos" select="-50 - (position() * 60)"/>

                    <circle cx="{$x-spacer * position()}" cy="{$y-pos}" r="{$magicEggs * $y-spacer}"
                        fill="rgb({$magicEggs * 40}, 0, {255 - ($magicEggs * 20)})" stroke="black"
                        stroke-width="2"/>

                    <rect x="{$x-spacer * position() - 15}" y="{$y-pos + 30}"
                        width="{$otherSpecials * 6}" height="{$otherSpecials * 6}"
                        fill="rgb(255, {200 - ($otherSpecials * 20)}, 0)" stroke="black"
                        stroke-width="2"/>

                </xsl:for-each>


            </g>
        </svg>
    </xsl:template>

</xsl:stylesheet>
