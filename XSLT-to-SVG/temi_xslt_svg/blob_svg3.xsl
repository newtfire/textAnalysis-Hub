<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:key name="whatsItKey" match="special" use="@whatsIt"/>
    
    <xsl:variable name="bar-width" select="40"/> <!-- Width of each bar -->
    <xsl:variable name="bar-spacing" select="80"/> <!-- Space between bars -->
    <xsl:variable name="y-scale" select="8"/> <!-- Scale factor for height -->
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg width="800" height="600">
            <desc>Animated Bar Graph based on XML Data</desc>
            
            <!-- Applying transformation -->
            <g transform="translate(100,500)">
                
                <!-- Axis -->
                <g>
                    <line x1="0" x2="600" y1="0" y2="0" stroke="black" stroke-width="2"/>
                    <line x1="0" x2="0" y1="0" y2="-400" stroke="black" stroke-width="2"/>
                </g>
                
                <!-- Legend (Right Side) -->
                <g transform="translate(650,-350)">
                    <text x="0" y="-20" font-size="16" fill="black">Legend:</text>
                    <xsl:for-each select="/xml//special[generate-id() = generate-id(key('whatsItKey', @whatsIt)[1])]">
                        <xsl:variable name="type" select="@whatsIt"/>
                        <xsl:variable name="count" select="count(key('whatsItKey', $type))"/>
                        <xsl:variable name="color">
                            <xsl:choose>
                                <xsl:when test="$type='powerUp'">rgb(255,182,193)</xsl:when>
                                <xsl:when test="$type='rocketShip'">rgb(255,105,180)</xsl:when>
                                <xsl:when test="$type='magicEgg'">rgb(219,112,147)</xsl:when>
                                <xsl:when test="$type='jabberwocky'">rgb(199,21,133)</xsl:when>
                                <xsl:when test="$type='boss'">rgb(186,85,211)</xsl:when>
                                <xsl:when test="$type='shield'">rgb(148,0,211)</xsl:when>
                                <xsl:when test="$type='dragon'">rgb(138,43,226)</xsl:when>
                                <xsl:when test="$type='invisibilityCloak'">rgb(128,0,128)</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <rect x="0" y="{(position() * 30)}" width="20" height="20" fill="{$color}"/>
                        <text x="30" y="{(position() * 30) + 15}" font-size="14" fill="black">
                            <xsl:value-of select="$type"/> (<xsl:value-of select="$count"/>)
                        </text>
                    </xsl:for-each>
                </g>
                
                <!-- Animated Bars -->
                <xsl:for-each select="/xml//special[generate-id() = generate-id(key('whatsItKey', @whatsIt)[1])]">
                    <xsl:variable name="type" select="@whatsIt"/>
                    <xsl:variable name="count" select="count(key('whatsItKey', $type))"/>
                    <xsl:variable name="height" select="$count * $y-scale"/>
                    <xsl:variable name="color">
                        <xsl:choose>
                            <xsl:when test="$type='powerUp'">rgb(255,182,193)</xsl:when>
                            <xsl:when test="$type='rocketShip'">rgb(255,105,180)</xsl:when>
                            <xsl:when test="$type='magicEgg'">rgb(219,112,147)</xsl:when>
                            <xsl:when test="$type='jabberwocky'">rgb(199,21,133)</xsl:when>
                            <xsl:when test="$type='boss'">rgb(186,85,211)</xsl:when>
                            <xsl:when test="$type='shield'">rgb(148,0,211)</xsl:when>
                            <xsl:when test="$type='dragon'">rgb(138,43,226)</xsl:when>
                            <xsl:when test="$type='invisibilityCloak'">rgb(128,0,128)</xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <g>
                        <desc><xsl:value-of select="$type"/> Data</desc>
                        <rect x="{position() * $bar-spacing}" 
                            y="0" 
                            width="{$bar-width}" 
                            height="0"
                            fill="{$color}">
                            <animate attributeName="height" from="0" to="{$height}" dur="1s" fill="freeze"/>
                            <animate attributeName="y" from="0" to="-{$height}" dur="1s" fill="freeze"/>
                        </rect>
                        <!-- Labels -->
                        <text x="{(position() * $bar-spacing) + ($bar-width div 2)}" 
                            y="-{$height - 10}" 
                            text-anchor="middle"
                            font-size="14"
                            fill="black">
                            <xsl:value-of select="$count"/>
                        </text>
                    </g>
                </xsl:for-each>
            </g>
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>