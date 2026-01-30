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
    
<!--    <xsl:variable name="x-spacer" select="200"/>-->
    
<!--    <xsl:variable name="y-spacer" select="10"/>-->
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->
            <g transform="translate(20 50)">
                <text font-size="40">The More Loving One - W. H. Auden</text>
                <text y="30" font-size="26">Punction Count</text>
            </g>
           <g transform="translate(20 500)">
            
            <xsl:for-each select="descendant::stanza">
                
                <xsl:variable name="countcma" select="count(descendant::cma)"/>
                <xsl:variable name="countprd" select="count(descendant::prd)"/>
                
                <!-- We'll process the blob elements in here and output a shape 
                    for each one -->
                <circle cx="{250 * position()}"
                    cy="-250" 
                    r="120"
                    fill="black"
                    stroke="black"
                    stroke-width="2"/>
                    
                
                <circle
                    cx="{250 * position()}"
                    cy="-230"
                    r="{$countcma * 20}"
                    fill="red"
                    stroke="white"
                    stroke-width="2"
                />
                <!--ebb: You had this complicated construction: cy="{(-230 mod position() * 20) - 220}, 
                    but you don't need it, when we realize that position()
                    is just controlling horizontal spacing, and the level of these circles is always
                    the same, so just give it -230 for y if you want something a bit off-center! 
                   -->

                <g transform="translate(20)">
                    <circle cx="20" cy="-45" r="10" fill="black" stroke="white" stroke-width="2"/>
                <text x="40" y="-40">Stanza</text>
                
                <circle cx="20" cy="-5" r="10" fill="red" stroke="white" stroke-width="2"/>
                <text x="40" >Commas</text>
                
                <circle cx="20" cy="35" r="10" fill="maroon" stroke="white" stroke-width="2"/>
                <text x="40" y="40">Periods</text>
                </g>
<!--                a bit brittle but...-->
                <!--ebb: Okay, down here, I think you're setting the center of the little traveling circle for periods
                to be somewhere around the perimeter of the comma circle, yes? So... the perimeter at the center
                plus the radius: 
                
                Wouldn't that be (from your comma circle):
                -230 + ($countcma * 20) 
                -->
                
<!--                tiny baby circle-->
                <circle
                    cx="{250 * position()}"
                    cy="-230"
                    r="{$countprd * 20}"
                    fill="maroon"
                    stroke="white"
                    stroke-width="2"
                    >
                    <!--cy="{(-230 mod position() * 20) - 180}"-->
                    <animateMotion
                        path=" 
                        M0,-40
                        m{$countcma * 20 + 10}, 0
                        a{$countcma * 20 + 10},{$countcma * 20 + 10} 0 1,0 {($countcma * 20 + 10) * -2},0
                        a{$countcma * 20 + 10},{$countcma * 20 + 10} 0 1,0  {($countcma * 20 + 10) * 2},0
                        "
                        begin="0s"
                        dur="{((position() + .3) div position())+2.5}s"
                        repeatCount="indefinite"/>
                </circle>
                <text x="{250 * position() -5}" 
                    y="{(-230 mod position() * 20) - 220 + 5}" stroke="white" fill="white">
                    <xsl:value-of select="$countcma"/></text>
                
                <text x="{250 * position() -5}"
                    y="{(-230 mod position() * 20) - 180 + 5}" 
                    stroke="white" fill="white"><xsl:value-of select="$countprd"/>
                    <!-- ebb: I haven't tried to adjust this yet, as it's not currently rolling around
                    the new coordinates I set. But I am investigating to see how animateMotion can be sent around
                    a circle....-->
                    <animateMotion
                        path=" 
                        M0,-40
                        m{$countcma * 20 + 10}, 0
                        a{$countcma * 20 + 10},{$countcma * 20 + 10} 0 1,0 {($countcma * 20 + 10) * -2},0
                        a{$countcma * 20 + 10},{$countcma * 20 + 10} 0 1,0  {($countcma * 20 + 10) * 2},0
                        "
                        begin="0s"
                        dur="{((position() + .3) div position())+2.5}s"
                        repeatCount="indefinite"/></text>
                
            </xsl:for-each>
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>