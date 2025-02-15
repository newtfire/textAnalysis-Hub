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
           <g transform="translate(100 500)">
            
            <xsl:for-each select="descendant::blob">
             <desc> magicEgg </desc> 
                <text x="-50" y="-250" fill="black" style="font-size:25px;" >magicEgg</text>
                <g> 
                <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
                <circle cx="{$x-spacer * position()}"
                    cy="{-250}" 
                    r="100"
                    fill="white"
                    stroke="rgb({count(descendant::special[@whatsIt='magicEgg']) * 20},0,0)"
                    stroke-width="2"
                />
                
                <circle cx="{$x-spacer * position()}"
                    cy="{-250}" 
                    r= "{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                    fill="rgb({count(descendant::special[@whatsIt='magicEgg']) * 50},{count(descendant::special[@whatsIt='magicEgg']) * 30},{count(descendant::special[@whatsIt='magicEgg']) * 5})"
                    stroke="orange"
                    stroke-width="1"
                />
                    
                    <desc> rocketShip </desc>   
                    <text x="-50" y="-50" fill="black" style="font-size:25px;" >rocketShip</text>
                    
                    <g> 
                        <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
                        <circle cx="{$x-spacer * position()}"
                            cy="{-50}" 
                            r="100"
                            fill="white"
                            stroke="rgb({count(descendant::special[@whatsIt='rocketShip']) * 20},0,0)"
                            stroke-width="2"
                        />
                        
                        <circle cx="{$x-spacer * position()}"
                            cy="{-50}" 
                            r= "{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}"
                            fill="rgb({count(descendant::special[@whatsIt='rocketShip']) * 10},{count(descendant::special[@whatsIt='rocketShip']) * 30},{count(descendant::special[@whatsIt='rocketShip']) * 45})"
                            stroke="blue"
                            stroke-width="1"
                        />
                    </g>
                    <desc> powerUp </desc>   
                    <text x="-50" y="150" fill="black" style="font-size:25px;" >powerUp</text>
                    <g> 
                        <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
                        <circle cx="{$x-spacer * position()}"
                            cy="{150}" 
                            r="100"
                            fill="white"
                            stroke="rgb({count(descendant::special[@whatsIt='powerUp']) * 20},0,0)"
                            stroke-width="2"
                        />
                        
                        <circle cx="{$x-spacer * position()}"
                            cy="{150}" 
                            r= "{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"
                            fill="rgb({count(descendant::special[@whatsIt='powerUp']) *30},{count(descendant::special[@whatsIt='powerUp']) *50},{count(descendant::special[@whatsIt='powerUp']) *10})"
                            stroke="yellow"
                            stroke-width="1"
                        />
                    </g>
                </g>
 
            </xsl:for-each> 
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>