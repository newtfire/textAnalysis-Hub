<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="xml">
        <xml><roles>
            <xsl:for-each select="distinct-values(//speaker)">
                <character><xsl:value-of select="current()"/></character>
            </xsl:for-each>
        </roles>
            <xsl:apply-templates/>
        </xml>
    </xsl:template> 
    
    <xsl:template match="xml/stage">
        <stage type="scene" n="{count(preceding-sibling::stage) + 1}"><xsl:apply-templates/></stage>
    </xsl:template>
    
    <xsl:template match="sp">
        <sp n="{count(preceding-sibling::sp) + 1}"><xsl:apply-templates/></sp>
    </xsl:template>
    
    
</xsl:stylesheet>