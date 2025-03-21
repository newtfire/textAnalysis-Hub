<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="chapter">
        <xsl:copy>
            <xsl:copy-of select="chapter-head-line/@*"/>
            <xsl:apply-templates select="chapter-body-line"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="chapter-body-line">
        <xsl:choose>
            <xsl:when test="matches(., '^[A-Z]:')">
                <sp speaker="{substring(., 1, 1)}">
                    <xsl:value-of select="substring(., 2)"/>
                </sp>
            </xsl:when>
            <xsl:otherwise>
                <aside>
                    <xsl:value-of select="."/>
                </aside>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
