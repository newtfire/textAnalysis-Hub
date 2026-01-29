<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="200"/>
    <xsl:variable name="y-spacer" select="10"/>
    <xsl:variable name="grid-spacer" select="-100"/>
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <svg width="100%" xmlns="http://www.w3.org/2000/svg">
            <desc>SVG created from <xsl:apply-templates select="//title"/></desc>
            
            <g transform="translate(20 500)">
              
                <g><desc>Axis lines and grid</desc>
                    <xsl:for-each select="(1 to 4)">
                        <line x1="0" x2="800" y1="{position() * $grid-spacer}" y2="{current() * $grid-spacer}" stroke-width="4" stroke="#990099"/>
                    </xsl:for-each>
                    <xsl:for-each select="(1 to 4)">
                        <line x2="0" x1="800" y1="{position() * $grid-spacer}" y2="{current() * $grid-spacer}" stroke-width="4" stroke="#330066"/>
                    </xsl:for-each>
                </g>
                
               
                <xsl:for-each select="descendant::blob">
                    <g>
                        <desc>Magic egg data</desc>
                       
                        <circle cx="{$x-spacer * position()}"
                            cy="{$y-spacer * position()}" 
                            r="{count(descendant::special[not(@whatsIt='magicEgg')]) * $y-spacer}"
                            fill="rgb(153, 51, 255)"
                            stroke="black"
                            stroke-width="2"
                            class="interactiveCircle" 
                            onclick="alert('Special count: {count(descendant::special[not(@whatsIt='magicEgg')])}')"
                            onmouseover="this.setAttribute('fill', 'red')"
                            onmouseout="this.setAttribute('fill', 'rgb(255, 0, 0)')"
                            />
                            <text x="{$x-spacer * position()}" y="-150"  text-anchor="middle">
                                <xsl:value-of select="count(descendant::special[@whatsIt='magicEgg']) * $y-spacer"/>
                            </text>
                    </g>
                    
                    <g>
                        <desc>All other specials</desc>
                        <text x="{$x-spacer * position()}" y="-350" text-anchor="middle">
                            <xsl:value-of select="count(descendant::special[not(@whatsIt='magicEgg')]) * $y-spacer"/>
                        </text>
                    </g>
                </xsl:for-each>
                
            </g>
            
            <!-- Adding JavaScript -->
            <script type="text/javascript">
               
                function updateCircleColor(event) {
                var circle = event.target;
                var currentColor = circle.getAttribute('fill');
                var newColor = (currentColor === 'rgb(153, 51, 255)') ? 'green' : 'rgb(153, 51, 255)';
                circle.setAttribute('fill', newColor);
                }
                
            
                var circles = document.querySelectorAll('.interactiveCircle');
                circles.forEach(function(circle) {
                circle.addEventListener('click', updateCircleColor);
                });
            </script>
            
        </svg>
    </xsl:template>
    
</xsl:stylesheet>
