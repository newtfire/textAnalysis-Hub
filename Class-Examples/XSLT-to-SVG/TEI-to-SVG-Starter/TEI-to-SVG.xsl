<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!-- ebb: Here's an XSLT file designed to read TEI and output SVG.
        Notice it has an xpath-default-namespace pointing to the TEI namespace. 
        We still need the SVG namespace to control the output in the XSLT root element:
        see the xmlns="http://www.w3.org/2000/svg" 
        
        I'm setting this up to process a TEI XML file from the Dandandan project last fall.
        This file is showing Season 1 Episode 1 of the Dandandan anime series. 
        
        Every <div> element is a scene location. You could plot something based on counts 
        of who or what is happening in the div elements: do some document analysis and see what
        makes sense! 
    -->
    
    
    <xsl:variable name="x-spacer" as="xs:integer" select="200"/>
    
    <xsl:variable name="y-spacer" as="xs:integer" select="10"/>
    <!-- Here (above) are the spacer variables we set up for a previous example. Change the numbers so they make sense for your plot. -->
    
    <xsl:variable name="xml-tree" as="document-node()" select="doc('ep-1tei.xml')"/>
    <!-- A kind of variable that matches to the current document node. We're going to need it later! -->
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->
           <g transform="translate(20 500)">
      
               <!-- We can explore and output, using XSLT, which locations are in each structural <div> of this episode! -->
               <g class="wholeEpisode">
                   <xsl:variable name="stageLocations" as="attribute()+" 
                       select="descendant::stage/@where"/>
                   <xsl:variable name="distinctStageLocs" as="xs:string+" 
                       select="$stageLocations => distinct-values() => sort()"/>
                   <xsl:comment>
                       Stage locations: <xsl:value-of select="$stageLocations"/>
                       Distinct stage locations: <xsl:value-of select="$distinctStageLocs"/>
                   </xsl:comment>
                   
                 <xsl:for-each select="$distinctStageLocs">
                       <!--ebb: We go through and look at each distinct stage location as a string. -->
                       <g class="LocationType">
                           <xsl:comment>
                               <xsl:value-of select="current()"/>
                           </xsl:comment>
                           
                           
                           <!-- ebb: This is a very challenging variable! We're going 
                           to count the following sibling <sp> elements after each <stage>, 
                           but *before* the next <stage>. -->
                           <xsl:variable name="currentStage" as="element()+" 
                               select="$xml-tree//stage[@where=current()]"/>
                           <!--ebb: This returns the matching elements (may be more than one) for this string.   -->
                           
                         <xsl:variable name="countSpeechesHere" as="xs:integer"
                         select="$currentStage//sp => count()"/>
                           
                           <xsl:comment>
                           How many speeches here? <xsl:value-of select="$countSpeechesHere"/>
                          </xsl:comment>
                           
                       </g>
   
                   </xsl:for-each>-->
          
               </g> 
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>