<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg"
            width="500" height="500">            
            <!--stem-->
            <line
                x1="{flowerHead/stem/@x1}"
                y1="{flowerHead/stem/@y1}"
                x2="{flowerHead/stem/@x2}"
                y2="{flowerHead/stem/@y2}" 
                style="{flowerHead/stem/@style}"
            />
            <!--petals-->
            <xsl:for-each select="flowerHead/petals/petal">
                <defs>
                    <radialGradient id="grad1" cx="50%" cy="50%" r="50%" fx="50%" fy="50%">
                        <stop offset="0%" stop-color="pink" />
                        <stop offset="100%" stop-color="purple" />
                    </radialGradient>
                </defs>
                <ellipse      
                rx="{@rx}" 
                ry="{@ry}" 
                cx="{@cx}" 
                cy="{@cy}" 
                fill="{@color}" 
                transform="{@transform}"
                />
            </xsl:for-each>           
            <!--flower head-->
            <defs>
                <radialGradient id="grad2" cx="50%" cy="50%" r="50%" fx="50%" fy="50%">
                    <stop offset="0%" stop-color="yellow" />
                    <stop offset="100%" stop-color="orange" />
                </radialGradient>
            </defs>
            <circle 
                cx="150" 
                cy="150" 
                r="{flowerHead/middle/@radius}" 
                fill="{flowerHead/middle/@color}"
            />
            <pattern id="stripe" width="10" height="10" patternUnits="userSpaceOnUse">
                <rect width="10" height="10" fill="yellow" />
                <line x1="0" y1="0" x2="0" y2="10" style="stroke:black; stroke-width:8" />
            </pattern>
            <!--bee-->
            <polygon points="300,80 270,90 270,70">
                <animateMotion
                    path="M 50, 100 a 50,50 0 1,0 100,0 a 50,50 0 1,0 -100,0"
                    begin="0s"
                    dur="5s"
                    repeatCount="indefinite"/>
            </polygon>
            <ellipse
                rx="{flowerHead/bee/@rx}"
                ry="{flowerHead/bee/@ry}"
                cx="{flowerHead/bee/@cx}"
                cy="{flowerHead/bee/@cy}"
                fill="{flowerHead/bee/@color}">
                <animateMotion
                    path="M 50, 100 a 50,50 0 1,0 100,0 a 50,50 0 1,0 -100,0"
                    begin="0s"
                    dur="5s"
                    repeatCount="indefinite"/>
            </ellipse>
            <xsl:for-each select="flowerHead/wings/wing">
                <filter id="f1" x="0" y="0" xmlns="http://www.w3.org/2000/svg">
                    <feGaussianBlur in="SourceGraphic" stdDeviation="1" />
                </filter>
                <ellipse
                    rx="{@rx}"
                    ry="{@ry}"
                    cx="{@cx}"
                    cy="{@cy}"
                    fill="{@color}"
                    transform="{@transform}"
                    filter="{@filter}">
                    <animateMotion
                        path="M 50, 100 a 50,50 0 1,0 100,0 a 50,50 0 1,0 -100,0"
                        begin="0s"
                        dur="5s"
                        repeatCount="indefinite" />
                </ellipse>
            </xsl:for-each>     
        </svg>            
    </xsl:template>   
</xsl:stylesheet>