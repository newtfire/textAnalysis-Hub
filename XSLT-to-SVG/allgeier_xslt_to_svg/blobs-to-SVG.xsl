<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    
    <!-- XSLT to transform XML to SVG -->
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Variables to control positioning -->
    <xsl:variable name="x-spacer" select="410"/>
    <xsl:variable name="y-spacer" select="10"/>
    
    <!-- Template to match the root of the document -->
    <xsl:template match="/">
        <svg width="100%" height="850">
            <desc>Superpowers</desc>
            
            <!-- Gradient Background -->
            <defs>
                <linearGradient id="bgGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                    <stop offset="0%" style="stop-color:black; stop-opacity:1.0" />
                    <stop offset="100%" style="stop-color:gray; stop-opacity:0.5" />
                </linearGradient>
            </defs>
            <rect width="100%" height="100%" fill="url(#bgGradient)" />
            
            <g stroke="lightgray" stroke-width="2">
                <line x1="260" y1="50" x2="260" y2="700"/>
                <line x1="600" y1="50" x2="600" y2="700"/>
                <line x1="880" y1="50" x2="880" y2="700"/>
                <line x1="1200" y1="50" x2="1200" y2="700"/>
                
            </g>
            
            <!-- Grouping blobs -->
            <g transform="translate(20 50)">
                
                <!-- Blob 1: magicEgg -->
                <xsl:for-each select="descendant::blob[1]">
                    <circle cx="{$x-spacer * 1}"
                        cy="300" 
                        r="100"
                        fill="#64c9ff"
                        stroke="black"
                        stroke-width="2"/>
                    
                </xsl:for-each>
                
                
                
                
                <!-- Blob 2: PowerUP -->
                <xsl:for-each select="descendant::blob[2]">
                    <circle cx="{$x-spacer * 1.75}"
                        cy="300" 
                        r="50"
                        fill="#ff6464"
                        stroke="black"
                        stroke-width="2"/>
                    
                </xsl:for-each>
                
                <!-- Blob 3: Rocket Ship -->
                <xsl:for-each select="descendant::blob[3]">
                    <circle cx="{$x-spacer * 2.49}"
                        cy="300" 
                        r="80"
                        fill="#ffa047"
                        stroke="black"
                        stroke-width="2"/>
                    
                </xsl:for-each>
                
                <desc>Boss</desc>
                <xsl:for-each select="descendant::blob">
                    <circle cx="{$x-spacer * position()}"
                        cy="{600}" 
                        r="{count(descendant::special[@whatsIt='boss']) * $y-spacer}"
                        fill="yellow"
                        stroke="black"
                        stroke-width="2"
                    />
                </xsl:for-each>
                
                <desc>Dragon</desc>
                <xsl:for-each select="descendant::blob">
                    <circle cx="{$x-spacer * position()}"
                        cy="{550}" 
                        r="{count(descendant::special[@whatsIt='dragon']) * $y-spacer}"
                        fill="orange"
                        stroke="black"
                        stroke-width="2"
                    />
                </xsl:for-each>
                
                <desc>Jabberwocky</desc>
                <xsl:for-each select="descendant::blob">
                    <circle cx="{1150}"
                        cy="{500}" 
                        r="{count(descendant::special[@whatsIt='jabberwocky']) * $y-spacer}"
                        fill="pink"
                        stroke="black"
                        stroke-width="2"
                    />
                </xsl:for-each>
                
                <desc>Shield</desc>
                <xsl:for-each select="descendant::blob">
                    <circle cx="{1150}"
                        cy="{550}" 
                        r="{count(descendant::special[@whatsIt='shield']) * $y-spacer}"
                        fill="black"
                        stroke="black"
                        stroke-width="2"
                    />
                </xsl:for-each>
                
                <desc>Invisiblity Cloak</desc>
                <xsl:for-each select="descendant::blob">
                    <circle cx="{1150}"
                        cy="{600}" 
                        r="{count(descendant::special[@whatsIt='invisibilityCloak']) * $y-spacer}"
                        fill="cyan"
                        stroke="black"
                        stroke-width="2"
                    />
                </xsl:for-each>
            
                
            </g>
            
            <!-- Text Elements -->
            <desc>Text Elements</desc>
            <g><text x="400" y="80" font-size="22" fill="white">Blob #1</text>
                <text x="700" y="80" font-size="22" fill="white">Blob #2</text>
                <text x="1000" y="80" font-size="22" fill="white">Blob #3</text>
                
                <text x="395" y="500" font-size="16" fill="white">Magic Egg</text>
                <text x="700" y="500" font-size="16" fill="white">Power UP</text>
                <text x="1005" y="500" font-size="16" fill="white">Rocket Ship</text>
                
            </g>
            
            
            <!-- Legend -->
            <desc>Legend</desc>
            <g>
                <!-- Circle for Boss -->
                <circle cx="30" cy="700" r="10" fill="yellow" stroke="black" stroke-width="2" />
                <text x="50" y="705" font-size="14" fill="white">Boss</text>
                
                <!-- Circle for Dragon -->
                <circle cx="30" cy="725" r="10" fill="orange" stroke="black" stroke-width="2" />
                <text x="50" y="730" font-size="14" fill="white">Dragon</text>
                
                <!-- Circle for Jabberwocky -->
                <circle cx="30" cy="750" r="10" fill="pink" stroke="black" stroke-width="2" />
                <text x="50" y="755" font-size="14" fill="white">Jabberwocky</text>
                
                <!-- Circle for Shield -->
                <circle cx="30" cy="775" r="10" fill="black" stroke="black" stroke-width="2" />
                <text x="50" y="780" font-size="14" fill="white">Shield</text>
                
                <!-- Circle for Invisibility Cloak -->
                <circle cx="30" cy="800" r="10" fill="cyan" stroke="black" stroke-width="2" />
                <text x="50" y="805" font-size="14" fill="white">Invisibility Cloak</text>
            </g>
            
        </svg>  
    </xsl:template>
    
</xsl:stylesheet>
