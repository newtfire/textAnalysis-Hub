<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:variable name="Poems" as="document-node()+"
        select="collection('../tei-collection/?select=*.xml')"/>
    <!-- 2022-12-04 ebb: I have revised the collection() to reach up and over to the official 
        type_transformed_tei directory where the quality-controlled TEI is now stored.  -->
        
    <xsl:template match="/">
        <html>
            <head>
                <title>Poems</title>
                <link rel="stylesheet" type="text/css" href="collection_tei.css"/> 
                
                <!-- ebb: Consider where the CSS file will be locatd in relation to output HTML when it's being
                developed in the docs/ directory for the project website. Does this line need to change? -->

            </head>
            <body>
                <h2>The New Negro Anthology, Poems</h2>
              <div class="wrapper"> 
                  <nav class="button">
                    <form action="index.html"><button class="Home">Home</button></form>
                    <form action="poems.html"><button class="Poems">Poems</button></form>
                    <form action="authors.html"><button class="Authors">Authors</button></form>
                    <form action="music.html"><button class="Music">Music</button></form>
                </nav>
                
                <ol>
                    <li><a href="#chap">A Brown Girl</a></li>
                    <li><a href="#chap">DREAM VARIATION</a></li>
                    <li><a href="#chap">ENCHANTMENT</a></li>
                    <li><a href="#chap">Part I</a></li>
                    <li><a href="#chap">Night</a></li>
                    <li><a href="#chap">Part II</a></li>
                    <li><a href="#chap">Part I</a></li>
                    <li><a href="#chap">Night</a></li>
                    <li><a href="#chap">Part II</a></li>
                    <li><a href="#chap">Georgia Dusk</a></li>
                    <li><a href="#chap">Minstrel Man</a></li>
                    <li><a href="#chap">OUR LAND</a></li>
                    <li><a href="#chap">SHE OF THE DANCING FEET SINGS</a></li>
                    <li><a href="#chap">Tableau</a></li>
                    <li><a href="#chap">THE DAY-BREAKERS</a></li>
                    <li><a href="#chap">THE NEGRO SPEAKS OF RIVERS</a></li>
                    <li><a href="#chap">TO A BROWN BOY</a></li>
                    <li><a href="#chap">TO A BROWN GIRL</a></li>
                    <li><a href="#chap">The Tropics in New York</a></li>
                    <li><a href="#chap">AN EARTH SONG</a></li>
                    <li><a href="#chap">BAPTISM</a></li>
                    <li><a href="#chap">Escape</a></li>
                    <li><a href="#chap">FRUIT OF THE FLOWER</a></li>
                    <li><a href="#chap">Harlem Wine</a></li>
                    <li><a href="#chap">IN MEMORY OF COLONEL CHARLES YOUNG</a></li>
                    <li><a href="#chap">I TOO</a></li>
                    <li><a href="#chap">Like a Strong Tree</a></li>
                    <li><a href="#chap">POEM</a></li>
                    <li><a href="#chap">RUSSIAN CATHEDRAL</a></li>
                    <li><a href="#chap">SONG</a></li>
                    <li><a href="#chap">Song of the Sun</a></li>
                    <li><a href="#chap">The Black Finger</a></li>
                    <li><a href="#chap">THE CREATION</a></li>
                    <li><a href="#chap">THE ORDEAL</a></li>
                    <li><a href="#chap">TO SAMUEL COLERIDGE TAYLOR, UPON HEARING HIS</a></li>
                    <li><a href="#chap">WHITE HOUSES</a></li>
                    <li><a href="#chap">YOUTH</a></li>
                </ol>
               
               <div class="display"> 
                   <xsl:apply-templates select="$Poems/TEI"/>
               </div>
              </div>
            </body>
        </html>
    </xsl:template>
    

    <xsl:template match="TEI">
        
        <!-- Want to pull in any teiHeader contents?  -->
        
        <!-- ebb: Not sure if we really want to process these. Commenting out for now.
            To see output of iframes with internet archive pages pulled in, see poems-iframes.html
            Some poems feature artwork! Remember we coded this in the teiHeader like this:
                       <facsimile>
                            <graphic url="https://archive.org/details/newnegrointerpre00unse/page/142/mode/2up"/>
                       </facsimile>
              
        <xsl:apply-templates select="descendant::facsimile/graphic"/> 
        -->
        
        <xsl:apply-templates select="descendant::div"/>
        
    </xsl:template>
    
  <!--  ebb: This doesn't turn out so great
      <xsl:template match="graphic">
        <div class="iframe">
            <iframe src="{@url}" title="artwork"/>
            <p>Artwork accompanying <xsl:apply-templates select="preceding::teiHeader//titleStmt/title"/></p>  
        </div>
  
    </xsl:template>
-->
    <xsl:template match="head">
        <h2><a id="{head}">
            <xsl:apply-templates/>
        </a></h2>
    </xsl:template>
    
    <xsl:template match="lg">
        <p class="stanza">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- ebb: I added a template to match on l elements and output lines properly, so they're broken on separate lines. 
       
        Line numbers might be nice to add to this template (below).
    You could output them in a special span and style them so they're smaller and in another color or something. -->
    <xsl:template match="l">
        
        <xsl:apply-templates/><br/>
        
    </xsl:template>
    
    
    <xsl:template match="byline">
        <div class="cursive">
            <xsl:apply-templates/>

        </div>
    </xsl:template>
    <!--ebb: In the next template, can we try to do  more with rs, given the variety of types and subtypes we have?
    What about making the @class be the value of @type, 
    and @title (which makes a tooltip) be the value of @subtype?
    Tooltips on mouseover expose their values, so it's worth a try to see how it adds to the output.
    
    <span class="theme" title="race">
    
    <span class="litDevice" title="metaphor">
   The values of @type are:
   POV
   litDevice
   theme
   
   actionWords
   printingError
   setting
   
   The top three (POV, litDevice and theme) all have a variety of subtype values (which is where tooltips come in handy)
 
        -->
 
    <xsl:template match="rs">
        <span class="{@type}" title="{@subtype='#hover'}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <!-- ebb: This template below isn't matching on anything because the source TEI files all have rhyme[@label].
        Maybe it's just as well? 
    I'm thinking italics are a little loud for this output: Usually poets are the ones to add italics for emphasis,
    so signalling rhyme patterns should maybe be more subtle, something handled with background-color? 
    What about showing matching rhyme patterns based on the different values of @label? 
    -->
 
 
 
    <xsl:template match="rs">       
            <span class ="{@type}" title="{@subtype}">
            <xsl:apply-templates/>
            </span>
    </xsl:template>
    
    
    <xsl:template match="rhyme">
        <span title="{@label}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
  
</xsl:stylesheet>