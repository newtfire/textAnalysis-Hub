<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 300 300">
            <desc>Transformed Snowman SVG with Enhancements</desc>
            
            <!-- Background Grid -->
            <g>
                <xsl:for-each select="1 to 10">
                    <line x1="0" y1="{position() * 30}" x2="300" y2="{position() * 30}" stroke="#ddd" stroke-width="1" />
                    <line x1="{position() * 30}" y1="0" x2="{position() * 30}" y2="300" stroke="#ddd" stroke-width="1" />
                </xsl:for-each>
            </g>
            
            <!-- Axes -->
            <line x1="0" y1="150" x2="300" y2="150" stroke="black" stroke-width="2" />
            <line x1="150" y1="0" x2="150" y2="300" stroke="black" stroke-width="2" />
            
            <!-- Snowman Group -->
            <g transform="translate(50,50)">
                <!-- Bottom Circle -->
                <circle cx="100" cy="220" r="40" fill="url(#gradient)" stroke="black" stroke-width="2" />
                
                <!-- Middle Circle -->
                <circle cx="100" cy="150" r="30" fill="url(#gradient)" stroke="black" stroke-width="2" />
                
                <!-- Top Circle (Head) -->
                <circle cx="100" cy="100" r="20" fill="url(#gradient)" stroke="black" stroke-width="2" />
                
                <!-- Eyes -->
                <circle cx="90" cy="90" r="3" fill="black" />
                <circle cx="110" cy="90" r="3" fill="black" />
                
                <!-- Nose -->
                <circle cx="100" cy="95" r="2.5" fill="black" />
                
                <!-- Smile -->
                <circle cx="87" cy="100" r="2" fill="black" />
                <circle cx="93" cy="105" r="2" fill="black" />
                <circle cx="100" cy="107" r="2" fill="black" />
                <circle cx="107" cy="105" r="2" fill="black" />
                <circle cx="113" cy="100" r="2" fill="black" />
                
                <!-- Arms (Fixed Incorrect `position()` Usage) -->
                <line x1="70" y1="150" x2="30" y2="120" stroke="brown" stroke-width="3" />
                <line x1="130" y1="150" x2="170" y2="120" stroke="brown" stroke-width="3" />
                
                <!-- Animation -->
                <animateTransform 
                    attributeName="transform" 
                    type="translate" 
                    from="0 0" 
                    to="100 100" 
                    dur="5s" 
                    repeatCount="indefinite" />
            </g>
            
            <!-- Gradient Definition -->
            <defs>
                <linearGradient id="gradient" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" style="stop-color:lightblue;stop-opacity:1" />
                    <stop offset="100%" style="stop-color:blue;stop-opacity:1" />
                </linearGradient>
            </defs>
            
        </svg>
    </xsl:template>
    
</xsl:stylesheet>




    