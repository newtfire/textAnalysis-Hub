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
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>

            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->

            <g id="grid">
                <xsl:for-each select="1 to 10">
                    <line x1="{position() * 100}" y1="-500" x2="{position() * 100}" y2="0"
                        stroke="lightgray" stroke-width="0.5"/>
                    <line x1="0" y1="{position() * -50}" x2="1000" y2="{position() * -50}"
                        stroke="lightgray" stroke-width="0.5"/>
                </xsl:for-each>
            </g>

            <g transform="translate(20 500)">

                <xsl:for-each select="descendant::blob">

                    <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
                    <circle cx="{$x-spacer * position()}" cy="{-250}"
                        r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                        fill="purple" stroke="black" stroke-width="2"/>
                    <text x="{$x-spacer * position()}" y="{-260}" font-size="14" fill="black">
                        <xsl:value-of select="@label"/>
                    </text>
                </xsl:for-each>
                <xsl:for-each select="descendant::node">
                    <rect x="{$x-spacer * position()}" y="{-300}" width="50"
                        height="{@height * $y-spacer}" fill="blue" stroke="black" stroke-width="2"/>
                    <text x="{$x-spacer * position()}" y="{-320}" font-size="14" fill="black">
                        <xsl:value-of select="@label"/>
                    </text>
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>

</xsl:stylesheet>
