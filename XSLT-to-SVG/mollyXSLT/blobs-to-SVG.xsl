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
            <g transform="translate(20 500)">

                <xsl:for-each select="descendant::blob">

                    <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
                    <circle cx="{$x-spacer * position()}" cy="{100}"
                        r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                        fill="red" stroke="black"/>
                    <text x="{$x-spacer * position() - 45}" y="100" fill="none" stroke="black" font-size="20">Magic Egg</text>
                </xsl:for-each>

                <xsl:for-each select="descendant::blob">
                    <circle cx="{$x-spacer * position() + 10}" cy="{0}"
                        r="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"
                        fill="orange" stroke="black"/>
                </xsl:for-each>
                
                <xsl:for-each select="descendant::blob">
                    <circle cx="{$x-spacer * position()}" cy="{-120}"
                        r="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}"
                        fill="yellow" stroke="black"/>
                </xsl:for-each>
                
                <xsl:for-each select="descendant::blob">
                    <circle cx="{$x-spacer * position()}" cy="{-100}"
                        r="{count(descendant::special[@whatsIt='boss']) * $y-spacer}"
                        fill="green" stroke="black"/>
                </xsl:for-each>
                
                <xsl:for-each select="descendant::blob">
                    <circle cx="{$x-spacer * position()}" cy="{-200}"
                        r="{count(descendant::special[@whatsIt='dragon']) * $y-spacer}"
                        fill="blue" stroke="black"/>
</xsl:for-each>

                <xsl:for-each select="descendant::blob">
                    <circle cx="{$x-spacer * position()}" cy="{-300}"
                        r="{count(descendant::special[@whatsIt='shield']) * $y-spacer}"
                        fill="purple" stroke="black"/>
                </xsl:for-each>
                
                <xsl:for-each select="descendant::blob">
                    <circle cx="{$x-spacer * position()}" cy="{-400}"
                        r="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer}"
                        fill="pink" stroke="black"/>
                </xsl:for-each>
                
                <xsl:for-each select="descendant::blob">
                    <circle cx="{$x-spacer * position()}" cy="{-450}"
                        r="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer}"
                        fill="brown" stroke="black"/>
                </xsl:for-each>
                
                <line x1="0" y1="-480" x2="0" y2="200" style="stroke:black;stroke-width:3" />
                <line x1="0" y1="200" x2="670" y2="200" style="stroke:black;stroke-width:3" />


            </g>
        </svg>
    </xsl:template>

</xsl:stylesheet>
