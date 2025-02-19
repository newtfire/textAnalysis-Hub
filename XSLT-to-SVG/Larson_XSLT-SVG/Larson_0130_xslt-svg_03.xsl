<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!--Blobs: XSLT to SVG REDUX: The Sequel - E.L.-->
    
    
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
               <rect x="-20" y="-350" width="100%" height="100%" fill="lightblue"/>
            
            <xsl:for-each select="descendant::blob">
                <desc>Magic Egg</desc>
                <circle cx="{$x-spacer * position()}"
                    cy="{-250}" 
                    r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                    fill="purple"
                    stroke="black"
                    stroke-width="2">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}" dur="4s"/>
                </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{-250}" 
                    r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer div 1.5}"
                    fill="yellow">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer div 1.5}" dur="4s"/>
                </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{-250}" 
                    r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer div 3}"
                    fill="red">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer div 3}" dur="4s"/>
                </circle>
               
               <desc>Power Up</desc>
                   <circle cx="{$x-spacer * position()}"
                       cy="{-150}" 
                       r="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"
                       fill="green"
                       stroke="black"
                       stroke-width="2">
                       <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}" dur="4s"/>
                   </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{-150}" 
                    r="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer div 1.5}"
                    fill="orange">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer div 1.5}" dur="4s"/> 
                </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{-150}" 
                    r="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer div 3}"
                    fill="purple">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer div 3}" dur="4s"/>
                </circle>
                
               <desc>Rocket Ship</desc>
                   <circle cx="{$x-spacer * position()}"
                       cy="{-50}" 
                       r="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}"
                       fill="red"
                       stroke="black"
                       stroke-width="2">
                       <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}" dur="4s"/>
               </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{-50}" 
                    r="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer div 1.5}"
                    fill="lightgreen">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer div 1.5}" dur="4s"/>
                </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{-50}" 
                    r="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer div 3}"
                    fill="blue">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer div 3}" dur="4s"/>
                </circle>
                
               <desc>Boss</desc>
                   <circle cx="{$x-spacer * position()}"
                       cy="{50}" 
                       r="{count(descendant::special[@whatsIt='boss']) * $y-spacer}"
                       fill="yellow"
                       stroke="black"
                       stroke-width="2">
                       <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='boss']) * $y-spacer}" dur="4s"/>
                  </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{50}" 
                    r="{count(descendant::special[@whatsIt='boss']) * $y-spacer div 1.5}"
                    fill="red">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='boss']) * $y-spacer div 1.5}" dur="4s"/>
                </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{50}" 
                    r="{count(descendant::special[@whatsIt='boss']) * $y-spacer div 3}"
                    fill="white">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='boss']) * $y-spacer div 3}" dur="4s"/>
                </circle>
                
               <desc>Dragon</desc>
                   <circle cx="{$x-spacer * position()}"
                       cy="{100}" 
                       r="{count(descendant::special[@whatsIt='dragon']) * $y-spacer}"
                       fill="orange"
                       stroke="black"
                       stroke-width="2">
                       <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='dragon']) * $y-spacer}" dur="4s"/>
                  </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{100}" 
                    r="{count(descendant::special[@whatsIt='dragon']) * $y-spacer div 1.5}"
                    fill="green">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='dragon']) * $y-spacer div 1.5}" dur="4s"/>
                </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{100}" 
                    r="{count(descendant::special[@whatsIt='dragon']) * $y-spacer div 3}"
                    fill="pink">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='dragon']) * $y-spacer div 3}" dur="4s"/>
                </circle>
                
                <desc>Jabberwocky</desc>
                       <circle cx="{$x-spacer * position()}"
                           cy="{150}" 
                           r="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer}"
                           fill="pink"
                           stroke="black"
                           stroke-width="2">
                           <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer}" dur="4s"/>
                       </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{150}" 
                    r="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer div 1.5}"
                    fill="blue">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer div 1.5}" dur="4s"/>
                </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{150}" 
                    r="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer div 3}"
                    fill="yellow">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer div 3}" dur="4s"/>
                </circle>
                
                
                       <desc>Shield</desc>
                           <circle cx="{$x-spacer * position()}"
                               cy="{200}" 
                               r="{count(descendant::special[@whatsIt='shield']) * $y-spacer}"
                               fill="black"                  stroke="black"                            stroke-width="2"         >
                               <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='shield']) * $y-spacer}" dur="4s"/>
               </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{200}" 
                    r="{count(descendant::special[@whatsIt='shield']) * $y-spacer div 1.5}"
                    fill="red">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='shield']) * $y-spacer div 1.5}" dur="4s"/>
                </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{200}" 
                    r="{count(descendant::special[@whatsIt='shield']) * $y-spacer div 3}"
                    fill="yellow">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='shield']) * $y-spacer div 3}" dur="4s"/>
                </circle>
                
               <desc>Invisiblity Cloak</desc>
                   <circle cx="{$x-spacer * position()}"
                       cy="{250}" 
                       r="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer}"
                       fill="cyan"
                       stroke="black"
                       stroke-width="2">
                       <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer}" dur="4s"/>
                   </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{250}" 
                    r="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer div 1.5}"
                    fill="pink">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer div 1.5}" dur="4s"/>
                </circle>
                <circle cx="{$x-spacer * position()}"
                    cy="{250}" 
                    r="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer div 3}"
                    fill="lightgreen">
                    <animate attributeName="r" from="0" to="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer div 3}" dur="4s"/>
                </circle>
               </xsl:for-each>
           </g>
            
            
            
            <g font-weight="bold">
                <desc>Text Elements</desc>
                <text x="200" y="27" font-size="12" fill="black">Blob #1</text>
            <text x="400" y="27" font-size="12" fill="black">Blob #2</text>
            <text x="600" y="27" font-size="12" fill="black">Blob #3</text>
            
            <text x="100" y="104" font-size="12" fill="black">Magic Egg</text>
            <text x="100" y="204" font-size="12" fill="black">Power-Up</text>
            <text x="100" y="304" font-size="12" fill="black">Rocket Ship</text>
            <text x="100" y="403" font-size="12" fill="black">Boss</text>
            <text x="100" y="453" font-size="12" fill="black">Dragon</text>
            <text x="100" y="503" font-size="12" fill="black">Jabberwocky</text>
            <text x="100" y="553" font-size="12" fill="black">Shield</text>
            <text x="100" y="602" font-size="12" fill="black">Invisibility Cloak</text>
            </g>
            
            <rect width="60%" height="100%" fill="lightyellow" stroke="red" stroke-width="3" x="48%" y="0"/>  
            <text x="1300" y="20" font-size="12" fill="black">E. Larson</text>
            <g transform="translate(-180, 110)">    <animate attributeName="opacity" from="0" to="1" dur="6s"/>
                <text x="67.75%" y="30"  font-size="20"  fill="red" font-weight="bold">
                "whatsIt" Counts:
            </text>
            
            <text x="70%" y="80"  font-size="16" fill="black">
                Power-Up - <xsl:value-of select="count(//special[@whatsIt='powerUp'])"/>
            </text>
            
            <text x="70%" y="120"  font-size="16" fill="black">
                Rocket Ship - <xsl:value-of select="count(//special[@whatsIt='rocketShip'])"/>
            </text>
            
            <text x="70%" y="160"  font-size="16" fill="black">
                Magic Egg - <xsl:value-of select="count(//special[@whatsIt='magicEgg'])"/>
            </text>
            
            <text x="70%" y="200"  font-size="16" fill="black">
                Jabberwocky - <xsl:value-of select="count(//special[@whatsIt='jabberwocky'])"/>
            </text>
            
            <text x="70%" y="240"  font-size="16" fill="black">
                Shield - <xsl:value-of select="count(//special[@whatsIt='shield'])"/>
            </text>
            
            <text x="70%" y="280"  font-size="16" fill="black">
                Invisibility Cloak - <xsl:value-of select="count(//special[@whatsIt='invisibilityCloak'])"/>
            </text>
            
            <text x="70%" y="320"  font-size="16" fill="black">
                Dragon - <xsl:value-of select="count(//special[@whatsIt='dragon'])"/>
            </text>
            
            <text x="70%" y="360"  font-size="16" fill="black">
                Boss - <xsl:value-of select="count(//special[@whatsIt='boss'])"/>
            </text></g>
            <g transform="translate(100,550)"><line x1="95" y1="50" x2="500" y2="50" stroke="black" stroke-width="2">
                    <animate attributeName="x2" from="95" to="500" dur="2s" fill="freeze"/>
            </line></g>
            <g transform="translate(100,500)"><line x1="37" y1="50" x2="500" y2="50" stroke="black" stroke-width="2">
                    <animate attributeName="x2" from="37" to="500" dur="2s" fill="freeze"/>
            </line></g>
            <g transform="translate(100,450)"><line x1="74" y1="50" x2="500" y2="50" stroke="black" stroke-width="2">
                    <animate attributeName="x2" from="74" to="500" dur="2s" fill="freeze"/>
            </line></g>
            <g transform="translate(100,400)"><line x1="45" y1="50" x2="300" y2="50" stroke="black" stroke-width="2">
                    <animate attributeName="x2" from="45" to="300" dur="2s" fill="freeze"/>
            </line></g>
            <g transform="translate(100,350)"><line x1="30" y1="50" x2="300" y2="50" stroke="black" stroke-width="2">
                    <animate attributeName="x2" from="30" to="300" dur="2s" fill="freeze"/>
            </line></g>
            
            <rect width="100%" height="40%" fill="lightyellow" stroke="red" stroke-width="3" x="0" y="90%"/>
            <rect width="50%" height="100%" fill="lightyellow" stroke="red" stroke-width="3" x="-45%" y="0"/>
            <rect width="100%" height="40%" fill="lightyellow" x="0" y="90.2%"/>
            <line x1="0" y1="0.5" x2="3000" y2="0.5" stroke-width="3" stroke="red"/>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>