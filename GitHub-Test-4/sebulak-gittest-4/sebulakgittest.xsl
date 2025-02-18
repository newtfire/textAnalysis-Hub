<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    <!--ss: i definitely just took all of this from the github-->
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="\[(.+?)\]" flags="s">
            <xsl:matching-substring>
                <info><xsl:value-of select="regex-group(1)"/></info>
            </xsl:matching-substring>
            
            <xsl:non-matching-substring>
                <xsl:apply-templates select="."/>
            </xsl:non-matching-substring>
            
        </xsl:analyze-string>
        
        
        
        <!--<xsl:analyze-string select="." regex="<sp>(.+?):" flags="s">
            
            ss: trying to match from start <sp> tag up until a colon. however, on lines without a colon, it just selects the whole line and i dont know how to exclude those lines.
            
            
            <xsl:matching-substring>
                <info><xsl:value-of select="regex-group(1)"/></info>
            </xsl:matching-substring>
            
            <xsl:non-matching-substring>
                <xsl:apply-templates select="."/>
            </xsl:non-matching-substring>
            
        </xsl:analyze-string>-->
    
    </xsl:template>
</xsl:stylesheet>