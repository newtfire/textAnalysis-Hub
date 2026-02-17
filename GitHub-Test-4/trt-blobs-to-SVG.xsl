<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math" version="3.0">

    <xsl:variable name="x-spacer" select="200"/>
    <xsl:variable name="y-spacer" select="10"/>

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>

            <g transform="translate(20 500)">

                <xsl:for-each select="descendant::blob">

                    <!-- Option (a): compare magicEgg specials to non-magicEgg specials -->
                    <xsl:variable name="magicCount"
                        select="count(descendant::special[@whatsIt = 'magicEgg'])"/>
                    <xsl:variable name="nonMagicCount"
                        select="count(descendant::special[not(@whatsIt = 'magicEgg')])"/>

                    <!-- magicEgg = purple circle -->
                    <circle cx="{$x-spacer * position()}" cy="{-250}" r="{$magicCount * $y-spacer}"
                        fill="purple" stroke="black" stroke-width="2"/>

                    <!-- non-magicEgg = gray square, offset to the right -->
                    <rect x="{($x-spacer * position() + 80) - ($nonMagicCount * $y-spacer)}"
                        y="{-250 - ($nonMagicCount * $y-spacer)}"
                        width="{$nonMagicCount * $y-spacer * 2}"
                        height="{$nonMagicCount * $y-spacer * 2}" fill="lightgray" stroke="black"
                        stroke-width="2"/>
                    <!-- lowkenuinley i did want to make it so the shapes overlap --> 

                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>

</xsl:stylesheet>
