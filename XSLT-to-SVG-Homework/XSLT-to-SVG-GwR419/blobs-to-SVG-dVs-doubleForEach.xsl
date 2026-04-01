<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="200"/>
    
    <xsl:variable name="y-spacer" select="7"/>
    
    <xsl:variable name="grid-spacer" select="-70"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <xsl:variable select="current()" name="source-xml" as="document-node()"/>
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>

           <g transform="translate(20 800)">
               
               
             <!--  <xsl:for-each select="(1 to 5)">
                   you could make regularly spaced lines with this. But you 
                   don't have to.
               </xsl:for-each> 
             -->
               
               <xsl:for-each select="descendant::special/@whatsIt => distinct-values()">
                   <xsl:variable name="current-whatsIt" select="current()" as="item()"/>
                   <xsl:variable name="current-y" select="position()" as="xs:integer"/>
                   
                   <text x="-5" y="{position() * $grid-spacer}" >
                       <xsl:value-of select="current()"/>
                   </text>
                   
                   <!-- INNER FOR LOOP HERE: We're plotting for every single distinct whatsIt,
                       a row to show its count in each blob. The INNER FOR LOOP is here to look 
                       inside each blob, in turn.
                   -->
                   <xsl:for-each select="$source-xml//blob">
                       <!-- The position() variable HERE goes with this INNER for loop 
                           (1 2 3 for every blob element) -->
                       <circle cx="{$x-spacer * position()}"
                           cy="{$current-y * $grid-spacer}" 
                           r="{count(descendant::special[@whatsIt=$current-whatsIt]) * $y-spacer}"
                           fill="rgb({$current-y * 10} , {$current-y * 10}, 55)"
                           stroke="red"
                           stroke-width="4"
                       />
                       
                   </xsl:for-each>
                                    
               
               </xsl:for-each>
               
           </g>
        </svg>
       
    </xsl:template>
    
 
</xsl:stylesheet>