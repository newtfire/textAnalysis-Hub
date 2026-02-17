<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml"/>
    
    <xsl:variable name="xml-tree" select="doc('Galioto_pokemonMoves.xml')"/>
    
    <xsl:variable name="pokemonCategories" select="$xml-tree//category => distinct-values()"/>
    <!-- text strings of the distinct categories -->
    
    <xsl:variable name="countCats" select="$pokemonCategories => count()"/>
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%" viewBox="0 0 600 1000">
            <g transform="translate(-185, 400)">
                <text x="300" y="-200" font-size="40">Pokemon Moves Data</text>
               
                <!-- Figure out a transform="translate()" that makes sense based on the size of your plot... -->
        <xsl:comment>
            Call some variables in here to see what they are.
            Wait...what are the categories? <xsl:value-of select="$pokemonCategories"/>
            Count of categories in Pokemon Moves file: <xsl:value-of select="$countCats"/>
        </xsl:comment>
                <!-- Plot something that represents the total count of everything (the whole; all the Pokemon move categories). -->
                <!-- Then you can use <xsl:for-each> on the distinct category strings. 
                  Inside <xsl:for-each> define some variables:
                  * a variable to hold the current() value
                  * a variable to reach into the $xml-tree to find out count of moves that hold each category:
                      Here is a handy XPath for this variable: $xml-tree//move[category=current()] => count()
                 * a variable to store the position() number inside the xsl:for-each. 
                 
                 We recommend that you keep testing your variables in <xsl:comment> 
                 just to check their values before plotting in SVG elements.
    
                 Study how we created the stacked plots based on position in our example code from class:
             https://github.com/newtfire/textAnalysis-Hub/blob/main/Class-Examples/XSLT-to-SVG/TEI-to-SVG-Starter/TEI-to-SVG.xsl#L140 
              -->
                
                <xsl:variable name="sortedPokemon" as="xs:string+">
                    <xsl:for-each select="$pokemonCategories">
                       <xsl:sort select="$xml-tree//move[category=current()] => count()" order="descending"/> 
                        <xsl:value-of select="current()"/>
                    </xsl:for-each>
                </xsl:variable>
                
                
                <xsl:for-each select="$sortedPokemon">
                   
                    <xsl:variable name="countCategories" select="$xml-tree//move[category=current()] => count()"/>
                    <xsl:variable name="position" select="position()"/>
                    <xsl:variable name="previousCount" as="xs:integer+">
                      <xsl:choose>
                          <xsl:when test="$position gt 1">
                            <xsl:for-each select="$sortedPokemon[position() lt $position]">
                                <xsl:value-of select="$xml-tree//move[category=current()] => count()"/>
                            </xsl:for-each>  
                          </xsl:when>
                          <xsl:otherwise>
                              <xsl:value-of select="0"/>
                          </xsl:otherwise>
                      </xsl:choose>  
                    </xsl:variable>
                    <xsl:variable name="stack" select="sum($previousCount)"/>
                    
                    <rect x="{$stack * 1.5 - 210}" y="0" width="{$countCategories * 1.5}" height="200" fill="rgb({50 + $position * 10}, 153, 204)" style="stroke-width:2;stroke:black;"/>
                    <g transform="translate({$stack * 1.5 -210 }, -22)">
                        <text><xsl:value-of select="current()"/></text>
                        <text y="15"><xsl:value-of select="$countCategories"/></text>
                    </g>
                </xsl:for-each>
                
              
                
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>