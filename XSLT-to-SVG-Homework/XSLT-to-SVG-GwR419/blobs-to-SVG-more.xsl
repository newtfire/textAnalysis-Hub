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
    
    <xsl:variable name="grid-spacer" select="-100"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->
           <g transform="translate(20 500)">
               <!-- Here we shift the 0, 0 coordinates over 20 (x direction) and down 500 (y direction from the top left of the screen -->
               
               
              <g><desc>Axis lines and legend</desc>
                  <!-- Let's plot this portion outside the for-each. Anything we can hand-draw that we only want to output once can go here -->
               
               
          <line x1="0" x2="800" y1="{position() * $grid-spacer}" y2="{current() * $grid-spacer}" stroke-width="4" stroke="#990099"/>

               <xsl:for-each select="(1 to 5)">
                   <line x1="0" x2="800" y1="{position() * $grid-spacer}" 
                       y2="{current() * $grid-spacer}" stroke-width="2" stroke="#dcb6de"/>

            
               <xsl:for-each select="(1 to 4)">
                  <line x2="0" x1="800" y1="{position() *$grid-spacer}" y2="{current()* $grid-spacer}" stroke-width="4" stroke="#330066" />
                
               </xsl:for-each>
            
               </xsl:for-each>
            
            <xsl:for-each select="descendant::blob">
                
                <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
            
             <g>
                  <desc>Magic egg data</desc>
                <circle cx="{$x-spacer * position()}"
                    cy="{-150}" 

                    r="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                    fill="rgb(220, {count(descendant::special[not(@whatsIt='magicEgg')]) * 40}, 222)"

                    stroke="black"
                    stroke-width="2"
                />
                  <text x="{$x-spacer * position()}" y="-150" text-anchor="middle"> 
                      <xsl:text>Magic Eggs: </xsl:text><xsl:value-of select="count(descendant::special[@whatsIt='magicEgg']) * $y-spacer"/>
                  </text>
              </g>
              <g>
                  <desc>All other specials</desc>
                  
                  <circle cx="{$x-spacer * position()}"
                      cy="{-350}" 
                      r="{count(descendant::special[not(@whatsIt='magicEgg')]) * $y-spacer}"
                      fill="rgb(220, 0, 222)"
                      stroke="black"
                      stroke-width="2"
                  />
              
                  <text x="{$x-spacer * position()}" y="-350" text-anchor="middle"> 
                      <xsl:text>All other special items: </xsl:text>
                      <xsl:value-of select="count(descendant::special[not(@whatsIt='magicEgg')]) * $y-spacer"/>
                  </text>

     

              </g>
            </xsl:for-each>
           </g>
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>