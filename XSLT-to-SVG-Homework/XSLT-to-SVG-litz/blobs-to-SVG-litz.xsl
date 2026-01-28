<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
   
    
    <xsl:variable name="x-spacer" select="200"/>
    
    <xsl:variable name="y-spacer" select="10"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
           
            <g transform="translate (150, 700) ">
                <line x1="0" y1="0" x2="700" y2="0" stroke="black" stroke-width="4"/> <line x1="0" y1="0" x2="0" y2="-600" stroke="black" stroke-width="4"/>
            </g>
           
           <g transform="translate(20 500)">
              <!-- <text
                   x="{$x-step * position()}"
                   y="20"
                   text-anchor="middle"
                   font-size="12"
                   fill="black">-->
                   <xsl:value-of select="title"/>
               <text x="155" y="70">Rocket Ship</text>
               
               <xsl:value-of select="title"/>
               <text x="355" y="70">Magic Egg</text>
               
               <xsl:value-of select="title"/>
               <text x="565" y="70">Dragon</text>
               
               
               
            <xsl:for-each select="descendant::blob">
                <xsl:variable name="count" select="count(descendant::special[@whatsIt='magicEgg'])"/>
                <!--<xsl:variable name="blob-count" select="count(descendant::blob)"/>                                      <xsl:variable name="chart-width" select="700"/>    <xsl:variable name="x-step"
                    select="$chart-width div ($blob-count + 1)"/>-->
                <circle cx="{$x-spacer * position()}"
                    r="{$count * $y-spacer}"
                    
                    cy="{-5}" 
                    fill="#66adbd"
                    stroke="blue"
                    stroke-width="3"> 
                
                    <animate
                        attributeName="r"
                        from="0"
                        to="{$count * $y-spacer}"
                        dur="0.8s"
                        begin="{position() * 0.2}s"
                        fill="freeze"/>
                    
                </circle>
                    
                    
                    
            </xsl:for-each>
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>