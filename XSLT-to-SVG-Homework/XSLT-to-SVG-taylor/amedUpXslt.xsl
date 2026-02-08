<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">

    <!-- Output SVG as XML (no XML declaration in the output file) -->
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="/">

        <!-- ====== SVG CANVAS / LAYOUT ====== -->
        <xsl:variable name="W" select="1400"/>
        <xsl:variable name="H" select="700"/>
        <xsl:variable name="marginL" select="120"/>
        <xsl:variable name="marginB" select="140"/>
        <xsl:variable name="top" select="90"/>

        <!-- tall -->
        <xsl:variable name="scale" select="18"/>

        <!-- Bar sizing -->
        <xsl:variable name="barWidth" select="34"/>
        <xsl:variable name="barGap" select="10"/>
        <xsl:variable name="xSpacer" select="260"/>

        <xsl:variable name="plotH" select="$H - $top - $marginB"/>
        <xsl:variable name="baselineY" select="$top + $plotH"/>

        <!-- Max value for ticks -->
        <xsl:variable name="maxVal" as="xs:integer" select="
                max(
                for $b in //blob
                return
                    max((
                    count($b//special[@whatsIt = 'magicEgg']),
                    count($b//special[not(@whatsIt = 'magicEgg')])
                    ))
                )"/>

        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="{$H}" viewBox="0 0 {$W} {$H}">

            <desc> SVG created from <xsl:value-of select="//title"/>
            </desc>

            <!-- Title -->
            <text x="{$marginL}" y="50" font-family="sans-serif" font-size="22"> magicEgg vs
                non-magicEgg specials (two purple bars per blob) </text>

            <!-- Axes -->
            <line x1="{$marginL}" y1="{$top}" x2="{$marginL}" y2="{$baselineY}" stroke="black"
                stroke-width="2"/>
            <line x1="{$marginL}" y1="{$baselineY}" x2="{$W - 60}" y2="{$baselineY}" stroke="black"
                stroke-width="2"/>

            <!-- Y label -->
            <text x="45" y="{($top + $baselineY) div 2}" font-family="sans-serif" font-size="12"
                transform="rotate(-90 45 {($top + $baselineY) div 2})"> count of specials </text>

            <!-- Y ticks -->
            <xsl:for-each select="0 to $maxVal">
                <xsl:variable name="t" select="."/>
                <xsl:variable name="y" select="$baselineY - ($t * $scale)"/>

                <line x1="{$marginL - 8}" y1="{$y}" x2="{$marginL}" y2="{$y}" stroke="black"/>

                <text x="{$marginL - 15}" y="{$y + 4}" font-family="sans-serif" font-size="10"
                    text-anchor="end">
                    <xsl:value-of select="$t"/>
                </text>
            </xsl:for-each>

            <!-- Bars -->
            <xsl:for-each select="//blob">
                <xsl:variable name="pos" select="position()"/>
                <xsl:variable name="label" select="normalize-space(heading)"/>

                <xsl:variable name="magicCount" select="count(.//special[@whatsIt = 'magicEgg'])"/>
                <xsl:variable name="nonMagicCount"
                    select="count(.//special[not(@whatsIt = 'magicEgg')])"/>

                <!-- Center of this blob’s pair of bars -->
                <xsl:variable name="cx" select="$marginL + ($xSpacer * $pos)"/>

                <xsl:variable name="magicH" select="$magicCount * $scale"/>
                <xsl:variable name="nonMagicH" select="$nonMagicCount * $scale"/>

                <!-- magicEgg bar (dark purple, left) -->
                <rect x="{$cx - $barWidth - ($barGap div 2)}" y="{$baselineY - $magicH}"
                    width="{$barWidth}" height="{$magicH}" fill="#7a3db8"/>

                <!-- non-magicEgg bar (light purple, right) -->
                <rect x="{$cx + ($barGap div 2)}" y="{$baselineY - $nonMagicH}" width="{$barWidth}"
                    height="{$nonMagicH}" fill="#c7a6e2"/>

                <!-- Value labels above bars -->
                <text x="{$cx - $barWidth}" y="{$baselineY - $magicH - 8}" font-family="sans-serif"
                    font-size="12" text-anchor="middle">
                    <xsl:value-of select="$magicCount"/>
                </text>

                <text x="{$cx + $barWidth}" y="{$baselineY - $nonMagicH - 8}"
                    font-family="sans-serif" font-size="12" text-anchor="middle">
                    <xsl:value-of select="$nonMagicCount"/>
                </text>

                <!-- Blob label -->
                <text x="{$cx}" y="{$baselineY + 40}" font-family="sans-serif" font-size="12"
                    text-anchor="middle">
                    <xsl:value-of select="$label"/>
                </text>

                <!-- Tiny key under each group -->
                <text x="{$cx}" y="{$baselineY + 60}" font-family="sans-serif" font-size="11"
                    text-anchor="middle"> dark = magicEgg | light = non-magic </text>
            </xsl:for-each>

            <!-- Legend -->
            <g transform="translate(980 95)">
                <rect x="0" y="0" width="18" height="18" fill="#7a3db8"/>
                <text x="28" y="14" font-family="sans-serif" font-size="12">magicEgg specials</text>

                <rect x="0" y="28" width="18" height="18" fill="#c7a6e2"/>
                <text x="28" y="42" font-family="sans-serif" font-size="12">non-magicEgg
                    specials</text>
            </g>

        </svg>
    </xsl:template>

</xsl:stylesheet>
