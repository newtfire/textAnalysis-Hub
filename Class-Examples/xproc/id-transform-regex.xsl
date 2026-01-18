<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
   
    <!--ebb: Add this output line for pretty-printing. -->
    <xsl:output method="xml" indent="yes"/>
   
    <!--ebb: The next line does the identity transformation, making a shallow copy of every XML node,
    that doesn't match a template rule. -->   
    <xsl:mode on-no-match="shallow-copy"/>

    
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="([OD]):(.+?\n)">
            <xsl:matching-substring>
                <d><!-- ebb: How about <d> for dialogue? -->
                    <char><xsl:value-of select="regex-group(1)"/></char>
                    <say><xsl:value-of select="regex-group(2)"/></say>
                </d>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
               <xsl:if test="not(matches(., '^\s+$'))">
                   <info><xsl:value-of select="normalize-space(.)"/></info>
               </xsl:if>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
</xsl:stylesheet>