<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
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
        
        We're making a stacked bar plot out of all the speeches in each location of a Dandandan episode!
        
        2026-01-30: IMPROVEMENTS TO TRY:
        * Sort the bars so they're based on counts rather than alphabetical by location.
        highest counts at the bottom to plot first (lowest positions). 
        * Animate each stack so it grows into position, following its sequence.
    -->
    
    
    <!-- Not really using this this time.  <xsl:variable name="x-spacer" as="xs:integer" select="200"/>
        We'll replace it with a color intensifier based on the number of different portions we're plotting.
    -->
   
    <xsl:variable name="y-spacer" as="xs:integer" select="-5"/>
    <!-- Here (above) are the spacer variables we set up for a previous example. 
        Change the numbers so they make sense for your plot. I made the y-spacer negative
    to help me plot up the screen from 1800. -->
    
    <xsl:variable name="xml-tree" as="document-node()" select="doc('ep-1tei.xml')"/>
    <!-- A kind of variable that matches to the current document node. We're going to need it later! -->
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <svg viewBox="0 0 600 1000">
            <!-- ebb: Try out the viewBox, which stretches a canvas from x y to x y, in this case
            0, 0 on the top left to 500, 1800 on bottom right, since 1800 is a little larger than my
            max absolute value of y * the y-spacer.  -->
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <!-- I'm applying transform="translate()" to anticipate that I need a plot with y values in the 500s.
                0,0 will move down the screen to 20, 500. 
            See https://www.w3schools.com/graphics/svg_transformations.asp 
            -->
           <g transform="translate(20 900)">
      
               <!-- We can explore and output, using XSLT, which locations are in each structural <div> of this episode! -->
               <g class="wholeEpisode">
                   <xsl:variable name="stageLocations" as="attribute()+" 
                       select="descendant::stage/@where"/>
                   <xsl:variable name="distinctStageLocs" as="xs:string+" 
                       select="$stageLocations => distinct-values()"/>
                   <!-- ebb: Each location will be a segment of the whole episode in the SVG plot. I'm going to try
                   making a color intensifer variable based on the count of all the locations. We'll try basing
                   this one one of the three rgb(?,?,?) values when we set colors for the stacked portion, remembering
                   that each of these is based on 255. 
                   -->
                   <!-- We WERE sorting these alphabetically, but we really want to sort them
                   based on the counts of speeches inside each <stage> element. So let's construct a variable
                   to do that here: -->
                   
                  <xsl:variable name="sortedStageLocs" as="xs:string+">
                      <xsl:for-each select="$distinctStageLocs">
                          <xsl:sort select="$xml-tree//stage[@where=current()]//sp => count()" 
                              order="descending"/>
                          <xsl:value-of select="current()"/>
                      </xsl:for-each>                   
                  </xsl:variable>
                      <xsl:comment>
                          SORTED stage locations:: <xsl:value-of select="$sortedStageLocs"/>
                      </xsl:comment>
                   
                   <xsl:variable name="colorIntensifier" select="255 div $distinctStageLocs => count()"/>
                   <xsl:comment>Color intensifier factor: <xsl:value-of select="$colorIntensifier"/></xsl:comment>
                   
                   <xsl:variable name="countAllSpeeches" as="xs:integer" 
                       select="descendant::sp => count()"/>
                   <xsl:comment>
                       Stage locations: <xsl:value-of select="$stageLocations"/>
                       Distinct stage locations: <xsl:value-of select="$distinctStageLocs"/>
                       Count of all speeches: <xsl:value-of select="$countAllSpeeches"/>
                       Count of all speeches * y-spacer: <xsl:value-of select="$countAllSpeeches * $y-spacer"/>
                   </xsl:comment>
                   
                   <text x="0" y="-850" style="text-anchor: middle; font-size:1.5em;">How much talking is happening in the locations of
                   <xsl:value-of select="descendant::teiHeader//title"/>?</text>
                   
                   
                   <!-- We'll make a stacked bar. Draw one rectangle or wide line in the background 
                       for the whole thing to show the totality. I find lines easier to remember how to draw b/c
                   I can just set a width on them. -->
                   
             <line id="allSpeeches" x1="0" x2="0" stroke-width="200" 
                 y1="0" y2="{$countAllSpeeches*$y-spacer}" stroke="rgb(200,200,200)"/>
                   <!-- Black in rgb is rgb(0,0,0). White is rgb(255,255,255). 
                       To make greys, set rgb values equal. -->
                   

                 <xsl:for-each select="$sortedStageLocs">
                       <!--ebb: We go through and look at each distinct stage location as a string. -->
                      <g class="location">
                           <xsl:variable name="LocationType" select="current()"/>
                           <xsl:variable name="LocationPosition" select="position()"/>
                           <!-- Position is going to be SUPER helpful inside an <xsl:for-each>: Each value
                               gets a distinct position number showing its order of processing. We can use
                               that number to put each stack on top of each other, calculate its color and more.
        
                          -->
                           <xsl:comment>
                               <xsl:value-of select="$LocationType"/>: 
                               Position <xsl:value-of select="$LocationPosition"/>
                           </xsl:comment>
                           
                           <!--ebb: This variable has to go back to the XML tree to find the <stage> element that
                           matches up with the current location text-string. 
                           -->
                           <xsl:variable name="currentStage" as="element()+" 
                               select="$xml-tree//stage[@where=$LocationType]"/>
                           <!--ebb: This returns the matching elements (may be more than one) for this string.   -->
                           <xsl:variable name="countSpeechesHere" as="xs:integer"
                               select="$currentStage//sp => count()"/>
                         
                           
                           <xsl:comment>
                           How many speeches here? <xsl:value-of select="$countSpeechesHere"/>
                          </xsl:comment>
                           
             
                           <!-- ebb: STACKING HAPPENS HERE!
                           We'll take the sum of the previous positions (and if it's first position, we plot from zero). 
                           -->

                                <xsl:variable name="previousCounts" as="xs:integer+">
                                    <!-- By typing this as xs:integer+ we say we expect 1 or more integers: We're going to use
                                    a sum() function to add up all the numbers we output here so we know how tall the preceding
                                    portion-stack was. -->
                                    <xsl:choose>
                                        <xsl:when test="$LocationPosition gt 1">
                                   <xsl:for-each select="$sortedStageLocs[position() lt $LocationPosition]">
                                       <xsl:value-of 
                                           select="$xml-tree//stage[@where=current()]//sp => count()"/>
                                   </xsl:for-each>
                                        </xsl:when>  
                                        <xsl:otherwise>
                                            <xsl:value-of select="0"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                               </xsl:variable>
                               <xsl:comment>
                                  All the previous counts: <xsl:value-of select="$previousCounts"/>
                               </xsl:comment>
                           
                           <xsl:variable name="y-stacker" as="xs:integer" select="sum($previousCounts) * $y-spacer"/>
                           
                           <!-- Now we plot our stack, and a nice text label!  -->
                           <line x1="0" x2="0" y1="{$y-stacker}" 
                               y2="{$y-stacker + $countSpeechesHere * $y-spacer}" 
                               stroke-width="200" stroke="rgb({$colorIntensifier * position()},200,200)"/>
                           <!-- Text label somewhere halfway up the current stack: -->
                           <text x="200" y="{$y-stacker + ($countSpeechesHere * $y-spacer div 2)}"
                               style="text-anchor: middle">
                               <xsl:value-of select="$LocationType"/>: <xsl:value-of select="$countSpeechesHere"/> speeches
                           </text>
            
                           
                         </g>
                   </xsl:for-each>
          
               </g> 
           </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>