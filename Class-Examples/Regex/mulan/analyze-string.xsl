<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!-- ebb: This is going to be an identity transformation over a minimally-tagged XML file for a movie script.
    The xsl:mode element marks this as a simple identity transform: XML to XML where we make changes to the existing code. 
    Here is an excellent tutorial on how to write xsl:analyze-string: http://dh.obdurodon.org/analyze-string.xhtml 
    
    You may want to start with a different regex than I did! 
    -->
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="\[(.+?)\]" flags="s">
            <!-- @flags="s" sets the "dot matches all" functionality in xsl:analyze-string. Remove it 
            if you need to prevent the dot from matching newline characters. -->
           <xsl:matching-substring>
               <stage><xsl:value-of select="regex-group(1)"/></stage>
           </xsl:matching-substring>
            
            <xsl:non-matching-substring>
                <xsl:analyze-string select="." regex="(^[A-Z].+?):">
                    <xsl:matching-substring>
                        <spk><xsl:value-of select="regex-group(1)"/></spk>
                    </xsl:matching-substring>
                    <xsl:non-matching-substring>
                        <xsl:apply-templates select="."/>
                    </xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:non-matching-substring>
            
        </xsl:analyze-string>
    </xsl:template>
    
    
</xsl:stylesheet>