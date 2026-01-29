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
            <circle 
                cx="150" 
                cy="150" 
                r="{flowerHead/middle/@radius}" 
                fill="{flowerHead/middle/@color}"
            />     
        </svg>            
    </xsl:template>
    
</xsl:stylesheet>