<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!--Blobs: XSLT to SVG - E.L.-->
    
    
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
            <desc>SVG created from <xsl:apply-templates select="//title"/> - EL</desc>
            
            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->
           <g transform="translate(20 350)">
            
            <desc>Magic Egg</desc>
            <xsl:for-each select="descendant::blob">
                <circle cx="{$x-spacer * position()}"
                    cy="{-250}" 
                    r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                    fill="purple"
                    stroke="black"
                    stroke-width="2"
                />
            </xsl:for-each>
               
               <desc>Power Up</desc>
               <xsl:for-each select="descendant::blob">
                   <circle cx="{$x-spacer * position()}"
                       cy="{-150}" 
                       r="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"
                       fill="green"
                       stroke="black"
                       stroke-width="2"
                   />
               </xsl:for-each>
               
               <desc>Rocket Ship</desc>
               <xsl:for-each select="descendant::blob">
                   <circle cx="{$x-spacer * position()}"
                       cy="{-50}" 
                       r="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}"
                       fill="red"
                       stroke="black"
                       stroke-width="2"
                   />
               </xsl:for-each>
               
               <desc>Boss</desc>
               <xsl:for-each select="descendant::blob">
                   <circle cx="{$x-spacer * position()}"
                       cy="{50}" 
                       r="{count(descendant::special[@whatsIt='boss']) * $y-spacer}"
                       fill="yellow"
                       stroke="black"
                       stroke-width="2"
                   />
               </xsl:for-each>
               
               <desc>Dragon</desc>
               <xsl:for-each select="descendant::blob">
                   <circle cx="{$x-spacer * position()}"
                       cy="{100}" 
                       r="{count(descendant::special[@whatsIt='dragon']) * $y-spacer}"
                       fill="orange"
                       stroke="black"
                       stroke-width="2"
                   />
               </xsl:for-each>
                   
                   <desc>Jabberwocky</desc>
                   <xsl:for-each select="descendant::blob">
                       <circle cx="{$x-spacer * position()}"
                           cy="{150}" 
                           r="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer}"
                           fill="pink"
                           stroke="black"
                           stroke-width="2"
                       />
                   </xsl:for-each>
                       
                       <desc>Shield</desc>
                       <xsl:for-each select="descendant::blob">
                           <circle cx="{$x-spacer * position()}"
                               cy="{200}" 
                               r="{count(descendant::special[@whatsIt='shield']) * $y-spacer}"
                               fill="black"
                               stroke="black"
                               stroke-width="2"
                           />
                       </xsl:for-each>
               
               <desc>Invisiblity Cloak</desc>
               <xsl:for-each select="descendant::blob">
                   <circle cx="{$x-spacer * position()}"
                       cy="{250}" 
                       r="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer}"
                       fill="cyan"
                       stroke="black"
                       stroke-width="2"
                   />
               </xsl:for-each>
           </g>
            
            
            <desc>Text Elements</desc>
            <g><text x="200" y="27" font-size="12" fill="black">Blob #1</text>
            <text x="400" y="27" font-size="12" fill="black">Blob #2</text>
            <text x="600" y="27" font-size="12" fill="black">Blob #3</text>
            
            <text x="100" y="100" font-size="12" fill="black">Magic Egg</text>
            <text x="100" y="200" font-size="12" fill="black">Power-Up</text>
            <text x="100" y="300" font-size="12" fill="black">Rocket Ship</text>
            <text x="100" y="400" font-size="12" fill="black">Boss</text>
            <text x="100" y="450" font-size="12" fill="black">Dragon</text>
            <text x="100" y="500" font-size="12" fill="black">Jabberwocky</text>
            <text x="100" y="550" font-size="12" fill="black">Shield</text>
            <text x="100" y="600" font-size="12" fill="black">Invisibility Cloak</text>
            <text x="1300" y="20" font-size="12" fill="black">E. Larson</text></g>
            
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>