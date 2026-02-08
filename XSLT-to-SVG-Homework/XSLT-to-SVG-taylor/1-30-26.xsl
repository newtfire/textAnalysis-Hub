<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        
        <!-- ===== VARIABLES ===== -->
        <xsl:variable name="W" select="1200"/>
        <xsl:variable name="H" select="650"/>
        <xsl:variable name="marginL" select="120"/>
        <xsl:variable name="top" select="90"/>
        <xsl:variable name="marginB" select="140"/>
        <xsl:variable name="scale" select="20"/>
        <xsl:variable name="barWidth" select="36"/>
        <xsl:variable name="barGap" select="12"/>
        <xsl:variable name="xStep" select="260"/>
        
        <xsl:variable name="plotH" select="$H - $top - $marginB"/>
        <xsl:variable name="baselineY" select="$top + $plotH"/>
        
        <!-- ===== SVG ===== -->
        <svg xmlns="http://www.w3.org/2000/svg"
            width="100%"
            height="{$H}"
            viewBox="0 0 {$W} {$H}">
            
            <!-- TITLE -->
            <text x="{$marginL}" y="50"
                font-family="sans-serif"
                font-size="22">
                magicEgg vs non-magicEgg specials per blob
            </text>
            
            <!-- AXES -->
            <line x1="{$marginL}" y1="{$top}"
                x2="{$marginL}" y2="{$baselineY}"
                stroke="black" stroke-width="2"/>
            
            <line x1="{$marginL}" y1="{$baselineY}"
                x2="{$W - 60}" y2="{$baselineY}"
                stroke="black" stroke-width="2"/>
            
            <!-- ===== BARS ===== -->
            <xsl:for-each select="//blob">
                <xsl:variable name="pos" select="position()"/>
                <xsl:variable name="label" select="normalize-space(heading)"/>
                
                <xsl:variable name="magicCount"
                    select="count(.//special[@whatsIt='magicEgg'])"/>
                <xsl:variable name="otherCount"
                    select="count(.//special[not(@whatsIt='magicEgg')])"/>
                
                <xsl:variable name="magicH" select="$magicCount * $scale"/>
                <xsl:variable name="otherH" select="$otherCount * $scale"/>
                
                <g transform="translate({$marginL + ($pos * $xStep)}, 0)">
                    
                    <!-- magicEgg bar (animated) -->
                    <rect
                        x="{-$barWidth - ($barGap div 2)}"
                        y="{$baselineY}"
                        width="{$barWidth}"
                        height="0"
                        fill="rgb(122,61,184)">
                        
                        <animate
                            attributeName="height"
                            from="0"
                            to="{$magicH}"
                            dur="0.8s"
                            fill="freeze"/>
                        
                        <animate
                            attributeName="y"
                            from="{$baselineY}"
                            to="{$baselineY - $magicH}"
                            dur="0.8s"
                            fill="freeze"/>
                        
                    </rect>
                    <text
                        x="{-$barWidth - ($barGap div 2) + ($barWidth div 2)}"
                        y="{$baselineY}"
                        font-size="12"
                        text-anchor="middle"
                        fill="black">
                        
                        <xsl:value-of select="$magicCount"/>
                        
                        <animate
                            attributeName="y"
                            from="{$baselineY}"
                            to="{$baselineY - $magicH - 6}"
                            dur="0.8s"
                            fill="freeze"/>
                        
                    </text>
                    
                    
                    <!-- non-magicEgg bar (animated) -->
                    <rect
                        x="{($barGap div 2)}"
                        y="{$baselineY}"
                        width="{$barWidth}"
                        height="0"
                        fill="rgb(199,166,226)">
                        
                        <animate
                            attributeName="height"
                            from="0"
                            to="{$otherH}"
                            dur="0.8s"
                            fill="freeze"/>
                        
                        <animate
                            attributeName="y"
                            from="{$baselineY}"
                            to="{$baselineY - $otherH}"
                            dur="0.8s"
                            fill="freeze"/>
                        
                    </rect>
                    
                    <!-- blob label -->
                    <text x="0"
                        y="{$baselineY + 40}"
                        font-size="12"
                        text-anchor="middle">
                        <xsl:value-of select="$label"/>
                    </text>
                    <text
                        x="{($barGap div 2) + ($barWidth div 2)}"
                        y="{$baselineY}"
                        font-size="12"
                        text-anchor="middle"
                        fill="black">
                        
                        <xsl:value-of select="$otherCount"/>
                        
                        <animate
                            attributeName="y"
                            from="{$baselineY}"
                            to="{$baselineY - $otherH - 6}"
                            dur="0.8s"
                            fill="freeze"/>
                        
                    </text>
                    
                    
                </g>
            </xsl:for-each>
            
            <!-- ===== LEGEND ===== -->
            <g transform="translate(880 100)">
                <rect x="0" y="0" width="18" height="18"
                    fill="rgb(122,61,184)"/>
                <text x="28" y="14" font-size="12">
                    magicEgg specials
                </text>
                
                <rect x="0" y="28" width="18" height="18"
                    fill="rgb(199,166,226)"/>
                <text x="28" y="42" font-size="12">
                    non-magicEgg specials
                </text>
            </g>
            
        </svg>
    </xsl:template>
    
</xsl:stylesheet>

                        