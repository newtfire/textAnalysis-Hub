<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml"/>
    
    <xsl:variable name="xml-tree" select="doc('pokemonmoves.xml')"/>
    
    <xsl:variable name="pokemonCategories" select="$xml-tree//category => distinct-values()"/>
    <!-- text strings of the distinct categories -->
    
    <xsl:variable name="countCats" select="$pokemonCategories => count()"/>
    
    
    <!-- set up some spacing and coloring variables, like an x-spacer, y-spacer, etc.  -->

    <!-- *************************************************************************-->
    <!-- Stacking question: How many Pokemon moves are classified in each category? 
        
    *  If you want to base your whole plot on a percentage, the total count = 100%: 
       You could plan your plot to be based on 100 percent units * $y-spacer
    *  Parts of the plot would be count-of-moves-in-each-category div total count * 100
    -->
    <!-- *************************************************************************-->

    
    <xsl:template match="/">
       <svg>
           <g>
               <!-- Figure out a transform="translate()" that makes sense based on the size of your plot... -->
        <xsl:comment>
            Call some variables in here to see what they are.
            Count of categories in Pokemon Moves file: <xsl:value-of select="$countCats"/>
        </xsl:comment>
              <!-- Plot something that represents the total count of everything (the whole; all the Pokemon move categories). -->
            
    
              <!-- Then you can use <xsl:for-each> on the distinct category strings. 
                  Inside <xsl:for-each> define some variables:
                  * a variable to hold the current() value
                  * a variable to reach into the $xml-tree to find out count of moves that hold each category:
                      Here is a handy XPath for this variable: $xml-tree//move[category="current()"] => count()
                 * a variable to store the position() number inside the xsl:for-each. 
                 
                 You can keep testing your variables in <xsl:comment> just to check them 
                 before plotting in SVG elements.
                      
                 If you want to plot a percentage-based drawing, divide the count of moves for the current category 
                 by the total count and multiply by 100. (You don't have to plot this way, but you may find it convenient.)
              -->
               
           </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>