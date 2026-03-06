<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!-- Change the numbers so they make sense for your plot. I made the y-spacer negative
    to help me plot up the screen from 1800. -->
    
    <xsl:variable name="xml-tree" as="document-node()" select="doc('Chapter21-25copy.xml')"/>
    <xsl:template match="/">
        <circl cx="{position()*40}" cy="{1800 - (number(@n)*10)} r="5" fill="red"/>
<title> test 6
        <xsl:value-of select="@n"/>
    </xsl:template>
    <!-- A kind of variable that matches to the current document node. We're going to need it later! -->
    
    <xsl:output method="xml" indent="yes"/>
    <!-- ebb: Try out the viewBox, which stretches a canvas from x y to x y, in this case
            0, 0 on the top left to 500, 1800 on bottom right, since 1800 is a little larger than my
            max absolute value of y * the y-spacer.  -->
    <desc>SVG created from <xsl:apply-templates select="//Chapter21-25copy.xml"/></desc>
    
    <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. -->
</xsl:stylesheet>