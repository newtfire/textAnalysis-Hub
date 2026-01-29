<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/2000/svg"
    xpath-default-namespace=""
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg width="1000" height="800" viewBox="0 0 1000 800">
            <text x="500" y="60" text-anchor="middle" font-family="sans-serif" font-size="32" font-weight="bold" fill="#333">
                Total Tag Frequency Comparison
            </text>
            
            <g transform="translate(150, 700)">
                <line x1="0" y1="0" x2="700" y2="0" stroke="black" stroke-width="4"/>
                <line x1="0" y1="0" x2="0" y2="-600" stroke="black" stroke-width="4"/>
                
                <xsl:variable name="totalBlobs" select="count(//blob)"/>
                <xsl:variable name="totalEggs" select="count(//special[@whatsIt='magicEgg'])"/>
                <xsl:variable name="totalOthers" select="count(//special[not(@whatsIt='magicEgg')])"/>
                
                <xsl:variable name="scale" select="40"/>
                
                <g>
                    <circle cx="150" cy="-120" r="50" fill="#00CED1" stroke="#008B8B" stroke-width="3"> 
                        <animateMotion path="M3,4 q75,175 120,-4 q80,-40 200,30" begin="0s" dur="10" repeatCount="indefinite" /></circle>
                    <text x="150" y="{-($totalBlobs * $scale) - 65}" text-anchor="middle" font-family="sans-serif" font-size="20" font-weight="bold">
                        <xsl:value-of select="$totalBlobs"/>
                    </text>
                    <text x="150" y="50" text-anchor="middle" font-family="sans-serif" font-size="18" font-weight="bold">Blob Tags</text>
                </g>
                
                <g>
                    <circle cx="350" cy="-140" r="50" fill="#FFD700" stroke="#DAA520" stroke-width="3">
                        <animateMotion path="M0,0 q60,100 100,0 q60,-20 100,0" begin="0s" dur="10s" repeatCount="indefinite" /></circle>
                    <text x="350" y="{-($totalEggs * $scale) - 65}" text-anchor="middle" font-family="sans-serif" font-size="20" font-weight="bold">
                        <xsl:value-of select="$totalEggs"/>
                    </text>
                    <text x="350" y="50" text-anchor="middle" font-family="sans-serif" font-size="18" font-weight="bold">Magic Eggs</text>
                </g>
                
                <g>
                    <circle cx="550" cy="-150" r="50" fill="#9370DB" stroke="#4B0082" stroke-width="3">
                        <animateMotion path="M1,1 q65,100 110,2 q70,-35 150,2" begin="0s" dur="10s" repeatCount="indefinite" /></circle>
                    <text x="550" y="{-($totalOthers * $scale) - 65}" text-anchor="middle" font-family="sans-serif" font-size="20" font-weight="bold">
                        <xsl:value-of select="$totalOthers"/>
                    </text>
                    <text x="550" y="50" text-anchor="middle" font-family="sans-serif" font-size="18" font-weight="bold">Other Tags</text>
                </g>
                
            </g> </svg>
    </xsl:template>
</xsl:stylesheet>