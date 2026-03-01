<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cbml="http://www.cbml.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
    
    <xsl:variable name="barHeight" select="35"/>
    <xsl:variable name="spacing" select="15"/>
    <xsl:variable name="chartWidth" select="750"/>
    
    <xsl:template match="/">
        <xsl:variable name="totalBalloons" select="count(//cbml:balloon[@who])"/>
        
        <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="600" viewBox="0 0 800 690">
            <style>
                .bar { transition: fill 0.3s; stroke: #333; stroke-width: 1; }
                .bar:hover { fill: #ffcc00 !important; }
                .label { font-family: 'Segoe UI', Tahoma, sans-serif; fill: #333; }
                .title { font-family: 'Segoe UI', sans-serif; font-weight: bold; fill: #2c3e50; }
                .percentage { font-size: 12px; font-weight: bold; }
            </style>
            
            <text x="50" y="40" class="title" font-size="22">
                Character Dialogue Distribution: Diavolo Emerges Part 1
            </text>
            
            <xsl:for-each-group select="//cbml:balloon[@who]" group-by="@who">
                <xsl:sort select="count(current-group())" order="descending"/>
                
                <xsl:variable name="currentCount" select="count(current-group())"/>
                <xsl:variable name="percent" select="($currentCount div $totalBalloons) * 100"/>
                
                <xsl:variable name="scaledWidth" select="($percent div 100) * $chartWidth"/>
                
                <xsl:variable name="yPos" select="(position() - 1) * ($barHeight + $spacing) + 80"/>
                
                <text x="45" y="{$yPos + ($barHeight div 1.5)}" class="label" text-anchor="end" font-size="14">
                    <xsl:value-of select="current-grouping-key()"/>
                </text>
                
                <rect x="55" y="{$yPos}" width="{$scaledWidth}" height="{$barHeight}" class="bar"
                    fill="hsl({position() * 45}, 65%, 55%)" rx="4"/>
                
                <text x="{$scaledWidth + 65}" y="{$yPos + ($barHeight div 1.5)}" class="label percentage">
                    <xsl:value-of select="format-number($percent, '0.0')"/>%
                </text>
                
            </xsl:for-each-group>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>