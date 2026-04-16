<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!--2026-04-13 ebb:  XSLT example for outputting a TSV for network analysis
        from TV/anime episodes in a collection, marked only for dialogue per file, 
        with filename as the shared container.
   
    What we're analyzing with XSLT:
    * Take distinct values of mentions of characters in each episode.
    * Output a count of how many times each character actually appears.
   *  Output the scene number with a marker for use in distinguishing the node types in Cytoscape.
    -->
    
    <xsl:output method="text" indent="no"/>
    
    <xsl:variable name="collection" as="document-node()+" select="collection('advtime-markup/?select=*.xml')"/>
    
    <xsl:variable name="distinctChars" as="xs:string+" select="$collection//character 
        ! normalize-space()
        ! upper-case(.) 
        => distinct-values()"/>
   

    <xsl:variable name="tab" as="xs:string">
        <xsl:text>&#x9;</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="newline" as="xs:string">
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>
    
    <xsl:template match="/">
        <!-- ebb: Column headings -->
        <xsl:text>character</xsl:text>
        <xsl:value-of select="$tab"/>
        <xsl:text>Source Node Attribute</xsl:text>
        <xsl:value-of select="$tab"/>
        <xsl:text>countSpeechesInEpisode</xsl:text>
        <xsl:value-of select="$tab"/>
        <xsl:text>Episode ID</xsl:text>
        <xsl:value-of select="$newline"/>
       
       <!-- Let's start with the distinct character names across ALL the episodes! -->
        
        <xsl:for-each select="$distinctChars">
            <xsl:variable name="currentChar" as="xs:string" select="current()"/>
            
            <!-- ebb :Now we dig through each episode to retrieve its info about the character! -->
            <xsl:for-each select="$collection">
                <xsl:variable name="countSpeeches" as="xs:integer" 
                    select="current()//character[.
                    ! normalize-space()
                    ! upper-case(.) = $currentChar] => count()"/>
                
               <xsl:if test="$countSpeeches &gt; 0"> 
                   
                   <xsl:value-of select="$currentChar"/>
                
                <xsl:value-of select="$tab"/>
                   
                   <xsl:text>character</xsl:text>
                   
                   <xsl:value-of select="$tab"/>
                <!-- ebb: now the count in each episode: -->
                <xsl:value-of select="$countSpeeches"/>
                <xsl:value-of select="$tab"/>
                
                <xsl:value-of select="current() ! base-uri() ! tokenize(., '/')[last()] "/>
                
                <xsl:value-of select="$newline"/></xsl:if>
          
            </xsl:for-each>
           
            
            
        </xsl:for-each>

     
    </xsl:template>
    
  
</xsl:stylesheet>