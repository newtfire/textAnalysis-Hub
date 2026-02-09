<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="1.0">
    <xsl:output method="xml"/>
    <xsl:key name="typeKey" match="type" use="normalize-space(.)"/>
    
    <!-- the xsl-to-svg section of code -->
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="2400" height="900">
            <style>
                text {
                    font-family: "Lucida Console";
                    font-size: 14px;
                    fill: #343434;
                }
                circle { opacity: 0.77; }
            </style>
            <!-- title of graph -->
            <g>
                <text x="600" y="30" text-anchor="middle" font-size="21">
                    Item Types in the Zenith Crafting Tree
                </text>
            </g>
            <!-- elements in graph -->
            <g>
                <!-- spacing between circles -->
                <xsl:variable name="spacing" select="300"/>
                
                <!-- finding the distinct <type> values -->
                <xsl:for-each select="//type[generate-id()=generate-id(key('typeKey', normalize-space(.))[1])]">
                    <!-- count how many times this type appears -->
                    <xsl:variable name="count" select="count(key('typeKey', normalize-space(.)))"/>
                    <xsl:variable name="i" select="position()"/>
                    <!-- circle -->
                    <circle
                        cx="{$spacing * $i}"
                        cy="200"
                        r="{10 * $count}"
                        fill="hsl({$i * 80}, 65%, 55%)"/>
                    <!-- label -->
                    <text
                        x="{$spacing * $i}"
                        y="{200 + (10 * $count) + 20}"
                        text-anchor="middle">
                        <xsl:value-of select="normalize-space(.)"/>
                        (<xsl:value-of select="$count"/>)
                    </text>
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>