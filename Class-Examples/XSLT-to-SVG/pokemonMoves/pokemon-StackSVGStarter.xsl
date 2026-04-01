<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet type="text/xsl" href="pokemon-StackSVGStarter.xsl"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="xml-tree" select="doc('pokemonMoves.xml')"/>
    
    <xsl:variable name="pokemonCategories" select="$xml-tree//category => distinct-values()"/>
    <xsl:variable name="countCats" select="$pokemonCategories => count()"/>
    
    <xsl:variable name="y-spacer" select="10"/>
    <xsl:variable name="bar-width" select="100"/>
    <xsl:variable name="totalMoves" select="$xml-tree//move => count()"/>
    
    <xsl:template match="/">
        <svg viewBox="0 0 500 {$totalMoves * $y-spacer + 100}" xmlns="http://www.w3.org/2000/svg">
            <g transform="translate(50, 50)"> <xsl:comment>
                    Categories: <xsl:value-of select="$pokemonCategories"/>
                    Total Categories: <xsl:value-of select="$countCats"/>
                </xsl:comment>
                
                <rect x="0" y="0" width="{$bar-width}" height="{$totalMoves * $y-spacer}" 
                    fill="none" stroke="black" stroke-width="2"/>
                
                <xsl:for-each select="$pokemonCategories">
                    <xsl:variable name="currentCat" select="current()"/>
                    <xsl:variable name="catCount" select="$xml-tree//move[category=$currentCat] => count()"/>
                    <xsl:variable name="pos" select="position()"/>
                    
                    <xsl:variable name="y-pos" select="sum(for $i in (1 to $pos - 1) 
                        return $xml-tree//move[category = $pokemonCategories[$i]] => count())"/>
                    
                    <rect x="0" y="{$y-pos * $y-spacer}" 
                        width="{$bar-width}" height="{$catCount * $y-spacer}" 
                        fill="hsl({$pos * 30}, 70%, 50%)" stroke="white">
                        <title><xsl:value-of select="$currentCat"/>: <xsl:value-of select="$catCount"/></title>
                    </rect>
                    
                    <text x="{$bar-width + 10}" y="{$y-pos * $y-spacer + ($catCount * $y-spacer div 2)}" 
                        font-family="sans-serif" font-size="12" alignment-baseline="middle">
                        <xsl:value-of select="$currentCat"/> (<xsl:value-of select="$catCount"/>)
                    </text>
                </xsl:for-each>
                
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>