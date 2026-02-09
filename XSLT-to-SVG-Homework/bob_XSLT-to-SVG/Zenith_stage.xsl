<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- key for distinct <stage> values -->
    <xsl:key name="stageKey" match="stage" use="normalize-space(.)"/>
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="1200" height="1200">
            <style>
                text {
                font-family: "Lucida Console";
                font-size: 14px;
                fill: #343434;
                }
                circle { opacity: 0.77; }
            </style>
            
            <!-- title -->
            <g>
                <text x="600" y="30" text-anchor="middle" font-size="21">
                    Item Stages in the Zenith Crafting Tree
                </text>
            </g>
            
            <!-- center coordinates and orbit radius -->
            <xsl:variable name="centerX" select="600"/>
            <xsl:variable name="centerY" select="600"/>
            <xsl:variable name="radiusOrbit" select="250"/>
            
            <!-- circles for each <stage> -->
            <g>
                <xsl:for-each select="//stage[generate-id()=generate-id(key('stageKey', normalize-space(.))[1])]">
                    <xsl:variable name="count" select="count(key('stageKey', normalize-space(.)))"/>
                    <xsl:variable name="i" select="position()"/>
                    <xsl:variable name="total" select="count(//stage[generate-id()=generate-id(key('stageKey', normalize-space(.))[1])])"/>
                    
                    <!-- calculating the starting angle per circle -->
                    <xsl:variable name="angle" select="360 * ($i - 1) div $total"/>
                    
                    <!-- the initial rotations of the circles -->
                    <g transform="rotate({$angle} {$centerX} {$centerY})">
                        <!-- circle at top of orbit -->
                        <circle
                            cx="{$centerX}"
                            cy="{$centerY - $radiusOrbit}"
                            r="{10 * $count}"
                            fill="hsl({$i * 90}, 65%, 55%)">
                            <!-- animating the circles' rotations in orbit around the center -->
                            <animateTransform 
                                attributeName="transform"
                                type="rotate"
                                from="0 {$centerX} {$centerY}"
                                to="360 {$centerX} {$centerY}"
                                dur="12s"
                                repeatCount="indefinite"/>
                        </circle>
                        
                        <!-- labels per circle -->
                        <text x="{$centerX}" y="{($centerY - $radiusOrbit) - (10 * $count) - 5}" text-anchor="middle">
                            <xsl:value-of select="normalize-space(.)"/>
                            (<xsl:value-of select="$count"/>)
                            <animateTransform 
                                attributeName="transform"
                                type="rotate"
                                from="0 {$centerX} {$centerY}"
                                to="360 {$centerX} {$centerY}"
                                dur="12s"
                                repeatCount="indefinite"/>
                        </text>
                    </g>
                    
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>
