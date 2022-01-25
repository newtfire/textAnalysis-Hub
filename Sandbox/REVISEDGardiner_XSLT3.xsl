<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html>
           <head><title>Montage of a Dream Deferred</title>
               <link rel="stylesheet" type="text/css" href="style.css"/>
               <style type="text/css"> </style>
           </head>
            <body>
                <xsl:apply-templates select="descendant::text"/>
            </body>
            
        </html>
        
        
    </xsl:template>
    
    <xsl:template match="title">
        <h1><xsl:apply-templates /></h1>
    </xsl:template>
    
   <xsl:template match="poem">
<section class="poem">        
       <xsl:apply-templates select="child::poemTitle"/>
       <section class="stanza"><xsl:apply-templates select="descendant::stanza"/></section>
       </section>
    </xsl:template>
    
    <xsl:template match="poemTitle">
        <h2><xsl:apply-templates /></h2>
    </xsl:template>
    
    <xsl:template match="stanza">
         <ol>
            <xsl:apply-templates select="child::line"/>
         </ol>
            
        
        
    </xsl:template>
    
    <xsl:template match="line">
        
            <li class="line"><xsl:apply-templates /></li>
        
    </xsl:template>
    
    <xsl:template match="format[@wordType='italics']">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    <xsl:template match="format[@wordType='underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>

    
    
    
</xsl:stylesheet>