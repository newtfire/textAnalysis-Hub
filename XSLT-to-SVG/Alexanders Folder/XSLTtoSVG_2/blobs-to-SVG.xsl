<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!-- ebb: This XSLT is designed to output SVG from information in an XML file.
        We need the SVG namespace to control the output in the XSLT root element:
        see the xmlns="http://www.w3.org/2000/svg" 
        
        The XSLT is reading in XML that has no namespace. 
        (If you are reading from XML in a namespace such as TEI,
        use the xpath-default-namespace="..." to apply it.) 
    -->
    
    <xsl:variable name="x-spacer" select="20"/>
    
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->
           <g>
            
            <xsl:for-each select="descendant::blob">
                
                <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
                <circle cx="{($x-spacer * (6*(position())))}"
                    cy="{100}" 
                    r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                    fill="purple"
                />

                
                <rect x="{($x-spacer * (6*(position())))}" y="{300}" 
                    width="{count(descendant::special[@whatsIt='rocketShip']) * $x-spacer}" 
                    height="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}"
                    fill="red"
                />

                <ellipse cx="{($x-spacer * (6*(position())))}" 
                    cy="{500}"
                    rx="{count(descendant::special[@whatsIt='jabberwocky']) * $x-spacer}" 
                    ry="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer}"
                    fill="pink"
                />

 
            </xsl:for-each>
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>