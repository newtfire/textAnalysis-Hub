<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!-- ebb: This is going to be an identity transformation over a minimally-tagged XML file for a movie script.
    The xsl:mode element marks this as a simple identity transform: XML to XML where we make changes to the existing code. 
    Here is an excellent tutorial on how to write xsl:analyze-string: http://dh.obdurodon.org/analyze-string.xhtml 
    -->
    <xsl:mode on-no-match="shallow-copy"/>
    
    
    <!-- ebb: Here we are going to match on the elements we've marked and look for regex patterns inside them using
        a special XSLT function called xsl:analyze-string.
    -->
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="([&lt;sp&gt;\n]+)(.+?)(:)" flags="s">
            <!-- @flags="s" sets the "dot matches all" functionality in xsl:analyze-string. Remove it 
            if you need to prevent the dot from matching newline characters. -->
            <xsl:matching-substring>
                <speaker><xsl:value-of select="regex-group(2)"/></speaker>
            </xsl:matching-substring>
            
            <xsl:non-matching-substring>
                <xsl:apply-templates select="."/>
            </xsl:non-matching-substring>
            
        </xsl:analyze-string>
    </xsl:template>
    
</xsl:stylesheet>