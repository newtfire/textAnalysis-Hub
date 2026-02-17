<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2000/svg">
    

    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <svg width="100%" height="100%">
            <!-- backg -->
            <rect width="100%" height="100%" fill="lightblue"/>
            
            <!-- header -->
            <text x="50%" y="50"
                font-family="Arial"
                font-size="30"
                fill="white"
                text-anchor="middle">
                Telegram to SVG
            </text>
            
            <!-- circles and translation -->
            <g transform="translate(50,150)">
                <xsl:for-each select="/xml/root/Message">
                    <xsl:variable name="pos" select="position()"/>
                    <xsl:variable name="NewFcount"
                        select="count(/xml/root/Message[@from='NewF'])"/>
                    
                    <g>
                        <xsl:attribute name="transform">
                            <xsl:text>translate(</xsl:text>
                            <xsl:value-of select="$pos * 100"/>
                            <xsl:text>,0) scale(</xsl:text>
                            
                            <!-- XSLT 1.0 conditional -->
                            <xsl:choose>
                                <xsl:when test="$NewFcount = 0">1</xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$NewFcount"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                            <xsl:text>)</xsl:text>
                        </xsl:attribute>
                        
                        <!-- circle -->
                        <circle r="10"
                            fill="pink"
                            stroke="black"
                            stroke-width="2"/>
                    </g>
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>