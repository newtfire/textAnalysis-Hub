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
    
    <xsl:variable name="x-spacer" select="200"/>
    <!-- ^ Custom variable -->
    <!-- ^"select" was originally 20, increase the space between eggs. -->
    
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
                <circle cx="{$x-spacer * position()}"
                    cy="{-250}" 
                    r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                    fill="purple"
                    stroke="black"
                    strokewidth="3"
                />
                <text x="450" y="-450" fill="brown" style="font-family:times-new-roman;font-size:50px;" >Inventory</text>
                <line x1="0" y1="-140" x2="900" y2="-140" stroke="black" stroke-width="4" stroke-opacity="1"></line>
                <text x="25" y="-150" fill="black" style="font-family:times-new-roman;font-size:20px;" >Magic Eggs</text>
                
                <rect x="{$x-spacer * position()}"
                    y="{-70}" 
                    r="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"
                    fill="blue"
                    stroke="black"
                    strokewidth="3"
                    width="50"
                    height="50"
                />
                <line x1="0" y1="-10" x2="900" y2="-10" stroke="black" stroke-width="4" stroke-opacity="1"></line>
                <text x="25" y="-20" fill="black" style="font-family:times-new-roman;font-size:20px;" >Power Ups</text>
                
                <rect x="{$x-spacer * position()}"
                    y="{40}" 
                    r="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}"
                    fill="grey"
                    stroke="black"
                    strokewidth="3"
                    width="100"
                    height="50"
                />
                <line x1="0" y1="100" x2="900" y2="100" stroke="black" stroke-width="4" stroke-opacity="1"></line>
                <text x="25" y="80" fill="black" style="font-family:times-new-roman;font-size:20px;" >Rocket Ammo</text>
 
            </xsl:for-each>
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>