<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math" version="3.0">

    <xsl:variable name="x-spacer" select="200"/>

    <xsl:variable name="y-spacer" select="10"/>

    <xsl:variable name="grid-spacer" select="50"/>

    <xsl:output method="xml" indent="yes"/>


    <xsl:template match="/">
        <svg width="100%">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>

            <!-- AFAIK this doesn't add it for each descendant - pretty much a leftover from me playing around  -->
            <xsl:variable name="radEgg" select="count(descendant::special[@whatsIt = 'magicEgg'])"/>
            <xsl:variable name="radShip"
                select="count(descendant::special[@whatsIt = 'rocketShip'])"/>
            <xsl:variable name="radBoss" select="count(descendant::special[@whatsIt = 'boss'])"/>
            <xsl:variable name="radDrag" select="count(descendant::special[@whatsIt = 'dragon'])"/>
            <xsl:variable name="radShield" select="count(descendant::special[@whatsIt = 'shield'])"/>
            <xsl:variable name="radCloak"
                select="count(descendant::special[@whatsIt = 'invisibilityCloak'])"/>
            <xsl:variable name="radJab"
                select="count(descendant::special[@whatsIt = 'jabberwocky'])"/>
            <xsl:variable name="radPow" select="count(descendant::special[@whatsIt = 'powerUp'])"/>

            <g transform="translate(20 500)">

                <xsl:for-each select="(1 to 16)">
                    <line x1="0" x2="670" y1="{320 -(position() * $grid-spacer)}"
                        y2="{320 - (current() * $grid-spacer)}" stroke-width="2" stroke="#e3e3e3"/>
                </xsl:for-each>

                <xsl:for-each select="descendant::blob">
                    
                    <rect x="{$x-spacer * position()}" y="{100}"
                        width="{count(descendant::special[@whatsIt='magicEgg']) * $y-spacer}"
                        height="50" fill="rgb(100, {count(special[@whatsIt='magicEgg']) * 30} ,100)" stroke="black" opacity="{position() * 0.3}"/>
                    <xsl:if test="count(descendant::special[@whatsIt = 'magicEgg']) &gt; 0">
                        <text x="{$x-spacer * position() + $radEgg}" y="125" fill="white"
                            stroke="black" font-size="25" opacity="{position() * 0.3}">
                            <xsl:value-of select="count(descendant::special[@whatsIt = 'magicEgg'])"
                            />
                        </text>
                    </xsl:if>

                    <circle cx="{$x-spacer * position() + 10}" cy="{0}" fill="rgb(100, {count([@whatsIt='magicEgg']) * 30} ,100)" stroke="black"
                        opacity="{position() * 0.3}"
                        r="{count(descendant::special[@whatsIt='powerUp']) * $y-spacer}"/>
                    <xsl:if test="count(descendant::special[@whatsIt = 'powerUp']) &gt; 0">
                        <text x="{$x-spacer * position() - $radPow div 2}" y="0" fill="white"
                            stroke="black" font-size="25" opacity="{position() * 0.3}">
                            <xsl:value-of select="count(descendant::special[@whatsIt = 'powerUp'])"
                            />
                        </text>
                    </xsl:if>

                    <circle cx="{$x-spacer * position()}" cy="{-120}"
                        r="{count(descendant::special[@whatsIt='rocketShip']) * $y-spacer}"
                        fill="rgb(100, {count([@whatsIt='rocketShip']) * 30} ,100)" stroke="black" opacity="{position() * 0.3}"/>
                    <xsl:if test="count(descendant::special[@whatsIt = 'rocketShip']) &gt; 0">
                        <text x="{$x-spacer * position() - $radShip div 2}" y="-120" fill="white"
                            stroke="black" font-size="25" opacity="{position() * 0.3}">
                            <xsl:value-of
                                select="count(descendant::special[@whatsIt = 'rocketShip'])"/>
                        </text>
                    </xsl:if>

                    <circle cx="{$x-spacer * position()}" cy="{-100}"
                        r="{count(descendant::special[@whatsIt='boss']) * $y-spacer}" fill="rgb(100, {count([@whatsIt='boss']) * 30} ,100)"
                        stroke="black" opacity="{position() * 0.3}"/>
                    <xsl:if test="count(descendant::special[@whatsIt = 'boss']) &gt; 0">
                        <text x="{$x-spacer * position() - $radBoss div 2}" y="-100" fill="white"
                            stroke="black" font-size="25" opacity="{position() * 0.3}">
                            <xsl:value-of select="count(descendant::special[@whatsIt = 'boss'])"/>
                        </text>
                    </xsl:if>

                    <circle cx="{$x-spacer * position()}" cy="{-200}"
                        r="{count(descendant::special[@whatsIt='dragon']) * $y-spacer}" fill="rgb(100, {count([@whatsIt='dragon']) * 30} ,100)"
                        stroke="black" opacity="{position() * 0.3}"/>
                    <xsl:if test="count(descendant::special[@whatsIt = 'dragon']) &gt; 0">
                        <text x="{$x-spacer * position() - ($radBoss div 2)*15}" y="-200"
                            fill="white" stroke="black" font-size="25" opacity="{position() * 0.3}">
                            <xsl:value-of select="count(descendant::special[@whatsIt = 'dragon'])"/>
                        </text>
                    </xsl:if>

                    <circle cx="{$x-spacer * position()}" cy="{-300}"
                        r="{count(descendant::special[@whatsIt='shield']) * $y-spacer}"
                        fill="rgb(100, {count([@whatsIt='shield']) * 30} ,100)" stroke="black" opacity="{position() * 0.3}"/>
                    <xsl:if test="count(descendant::special[@whatsIt = 'shield']) &gt; 0">
                        <text x="{$x-spacer * position() - ($radShield div 2)*15}" y="-300"
                            fill="white" stroke="black" font-size="25" opacity="{position() * 0.3}">
                            <xsl:value-of select="count(descendant::special[@whatsIt = 'shield'])"/>
                        </text>
                    </xsl:if>

                    <circle cx="{$x-spacer * position()}" cy="{-400}"
                        r="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer}"
                        fill="rgb(100, {count([@whatsIt='invisibilityCloak']) * 30} ,100)" stroke="black" opacity="{position() * 0.3}"/>
                    <xsl:if test="count(descendant::special[@whatsIt = 'invisibilityCloak']) &gt; 0">
                        <text x="{$x-spacer * position() - ($radCloak div 2)*15}" y="-400"
                            fill="white" stroke="black" font-size="25" opacity="{position() * 0.3}">
                            <xsl:value-of
                                select="count(descendant::special[@whatsIt = 'invisibilityCloak'])"
                            />
                        </text>
                    </xsl:if>

                    <circle cx="{$x-spacer * position()}" cy="{-450}"
                        r="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer}"
                        fill="rgb(100, {count([@whatsIt='jabberwocky']) * 30} ,100)" stroke="black" opacity="{position() * 0.3}"/>
                    <xsl:if test="count(descendant::special[@whatsIt = 'jabberwocky']) &gt; 0">
                        <text x="{$x-spacer * position() - ($radJab div 2)*15}" y="-450"
                            fill="white" stroke="black" font-size="25" opacity="{position() * 0.3}">
                            <xsl:value-of
                                select="count(descendant::special[@whatsIt = 'jabberwocky'])"/>
                        </text>
                    </xsl:if>
                </xsl:for-each>

                <line x1="0" x2="670" y1="220" y2="220" style="stroke:black;stroke-width:3"/>
                <line x1="0" y1="-480" x2="0" y2="220" style="stroke:black;stroke-width:3"/>
                
               


            </g>
        </svg>
    </xsl:template>

</xsl:stylesheet>
