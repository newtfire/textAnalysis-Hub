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
    
    <xsl:variable name="y-spacer" select="100"/>
    
    <xsl:variable name="rectx-spacer" select="50"/>
    
    <xsl:variable name="recty-spacer" select="50"/>
    
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->
            
           <rect width="100%" height="100%" fill="black" ></rect>
              
                
                
            
            
           <g transform="translate(20 600)">
            
            <xsl:for-each select="descendant::blob">
                
                <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
                <circle cx="{$x-spacer}"
                    cy="{$y-spacer * position() * (-1)}" 
                    r="{count(//special[@whatsIt='magicEgg']) * 10}"
                    fill="white"
                    stroke="black"
                    stroke-width="2"
                />
                <rect width="{count(descendant::special[@whatsIt ='boss']) * $rectx-spacer}" height="{count(descendant::special[@whatsIt ='boss']) * $recty-spacer}" fill="red" stroke="black"></rect>
                
                
 
            </xsl:for-each>
               <xsl:for-each select="descendant::blob">
               <circle r="{count(//special[@whatsIt='rocketShip'])*10}"
                    cx="200"
                    cy="{100 * position() * -1} "
                    fill="rgb({count(descendant::special[@whatsIt='magicEgg'])* 10}, {count(descendant::special[@whatsIt='magicEgg'])* 10}, 0)"
                    stroke ="black"></circle>
               
               </xsl:for-each>
               
           </g>
            
            
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>