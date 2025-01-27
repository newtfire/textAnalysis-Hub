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
    
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->
           <g transform="translate(20 350)">
            
               <xsl:for-each select="descendant::blob">
                   
                   <text x="{$x-spacer * position()}"
                       y="{-300}" 
                       font-size="14" 
                       text-anchor="middle" 
                       fill="black">
                       <xsl:value-of select="concat('Blob ', position())"/>
                   </text>
                   
                   <circle cx="{$x-spacer * position()}"
                       cy="{-250}" 
                       r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                       fill="purple"
                       stroke="black"
                       stroke-width="2"
                   />
                   <text x="{$x-spacer * position()}"
                       y="{-270}" 
                       font-size="12" 
                       text-anchor="middle" 
                       fill="black">
                       <xsl:value-of select="concat('magicEgg: ', count(descendant::special[@whatsIt='magicEgg']))"/>
                   </text>
                   
                   <circle cx="{$x-spacer * position()}"
                       cy="{-150}" 
                       r="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"
                       fill="purple"
                       stroke="black"
                       stroke-width="2"
                   />
                   <text x="{$x-spacer * position()}"
                       y="{-170}" 
                       font-size="12" 
                       text-anchor="middle" 
                       fill="black">
                       <xsl:value-of select="concat('powerUp: ', count(descendant::special[@whatsIt='powerUp']))"/>
                   </text>
                   
                   <circle cx="{$x-spacer * position()}"
                       cy="{-50}" 
                       r="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}"
                       fill="purple"
                       stroke="black"
                       stroke-width="2"
                   />
                   <text x="{$x-spacer * position()}"
                       y="{-70}" 
                       font-size="12" 
                       text-anchor="middle" 
                       fill="black">
                       <xsl:value-of select="concat('rocketShip: ', count(descendant::special[@whatsIt='rocketShip']))"/>
                   </text>
                   
                   <circle cx="{$x-spacer * position()}"
                       cy="{50}" 
                       r="{count(descendant::special[@whatsIt='boss']) * $y-spacer}"
                       fill="purple"
                       stroke="black"
                       stroke-width="2"
                   />
                   <text x="{$x-spacer * position()}"
                       y="{30}" 
                       font-size="12" 
                       text-anchor="middle" 
                       fill="black">
                       <xsl:value-of select="concat('boss: ', count(descendant::special[@whatsIt='boss']))"/>
                   </text>
                   
                   <circle cx="{$x-spacer * position()}"
                       cy="{150}" 
                       r="{count(descendant::special[@whatsIt='dragon']) * $y-spacer}"
                       fill="purple"
                       stroke="black"
                       stroke-width="2"
                   />
                   <text x="{$x-spacer * position()}"
                       y="{130}" 
                       font-size="12" 
                       text-anchor="middle" 
                       fill="black">
                       <xsl:value-of select="concat('dragon: ', count(descendant::special[@whatsIt='dragon']))"/>
                   </text>
                   
                   <circle cx="{$x-spacer * position()}"
                       cy="{250}" 
                       r="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer}"
                       fill="purple"
                       stroke="black"
                       stroke-width="2"
                   />
                   <text x="{$x-spacer * position()}"
                       y="{230}" 
                       font-size="12" 
                       text-anchor="middle" 
                       fill="black">
                       <xsl:value-of select="concat('jabberwocky: ', count(descendant::special[@whatsIt='jabberwocky']))"/>
                   </text>
                   
                   <circle cx="{$x-spacer * position()}"
                       cy="{350}" 
                       r="{count(descendant::special[@whatsIt='shield']) * $y-spacer}"
                       fill="purple"
                       stroke="black"
                       stroke-width="2"
                   />
                   <text x="{$x-spacer * position()}"
                       y="{330}" 
                       font-size="12" 
                       text-anchor="middle" 
                       fill="black">
                       <xsl:value-of select="concat('shield: ', count(descendant::special[@whatsIt='shield']))"/>
                   </text>
                   
                   <circle cx="{$x-spacer * position()}"
                       cy="{450}" 
                       r="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer}"
                       fill="purple"
                       stroke="black"
                       stroke-width="2"
                   />
                   <text x="{$x-spacer * position()}"
                       y="{430}" 
                       font-size="12" 
                       text-anchor="middle" 
                       fill="black">
                       <xsl:value-of select="concat('invisibilityCloak: ', count(descendant::special[@whatsIt='invisibilityCloak']))"/>
                   </text>
                   
               </xsl:for-each>
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>