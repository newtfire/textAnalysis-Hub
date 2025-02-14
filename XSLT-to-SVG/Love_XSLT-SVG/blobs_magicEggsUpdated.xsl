<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math" version="3.0">
    <!-- ebb: This XSLT is designed to output SVG from information in an XML file.
        We need the SVG namespace to control the output in the XSLT root element:
        see the xmlns="http://www.w3.org/2000/svg" 
        
        The XSLT is reading in XML that has no namespace. 
        (If you are reading from XML in a namespace such as TEI,
        use the xpath-default-namespace="..." to apply it.) 
    -->

    <xsl:variable name="x-spacer" select="200"/>

    <xsl:variable name="y-spacer" select="10"/>

    <xsl:output method="xml" indent="yes"/>


    <xsl:template match="/">
        <svg width="100%" height="600">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>

            <desc> Draw X and Y axis </desc>
            <line x1="50" y1="550" x2="950" y2="550" stroke="black" stroke-width="2"/>
            <line x1="50" y1="550" x2="50" y2="50" stroke="black" stroke-width="2"/>

            <desc> Axis labels </desc>
            <text x="500" y="580" font-size="14" text-anchor="middle">X-Axis</text>
            <text x="20" y="300" font-size="14" text-anchor="middle"
                transform="rotate(-90, 20, 300)">Y-Axis</text>

            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->

            <g id="grid">
                <xsl:for-each select="1 to 10">
                    <line x1="{50 + position() * $x-spacer}" y1="50"
                        x2="{50 + position() * $x-spacer}" y2="550" stroke="lightgray"
                        stroke-width="0.5"/>
                    <line x1="50" y1="{550 - position() * $y-spacer}" x2="950"
                        y2="{550 - position() * $y-spacer}" stroke="lightgray" stroke-width="0.5"/>
                </xsl:for-each>
            </g>

            <g transform="translate(20 500)">

                <xsl:for-each select="descendant::blob">

                    <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
                    <circle cx="{50 + position() * $x-spacer}" cy="{550 - (number(@value) * 5)}"
                        r="{count(descendant::special[@whatsIt='magicEgg']) * 5}"
                        fill="rgb({number(@value) * 10}, 100, {255 - number(@value) * 10})"
                        stroke="black" stroke-width="2"/>
                    <text x="{50 + position() * $x-spacer}" y="{550 - (number(@value) * 5) - 15}"
                        font-size="12" text-anchor="middle" fill="black">
                        <xsl:value-of select="@label"/>
                    </text>
                </xsl:for-each>
                <xsl:for-each select="descendant::node">
                    <text x="{50 + position() * $x-spacer + 20}"
                        y="{550 - (@height * $y-spacer) - 10}" font-size="12" text-anchor="middle"
                        fill="black">
                        <xsl:value-of select="@label"/>
                    </text>
                    <rect x="{50 + position() * $x-spacer}" y="{550 - (@height * $y-spacer)}"
                        width="40" height="{@height * $y-spacer}" fill="blue" stroke="black"
                        stroke-width="2"/>
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>

</xsl:stylesheet>
