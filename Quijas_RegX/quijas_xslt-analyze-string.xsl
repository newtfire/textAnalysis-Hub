<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no"
        include-content-type="no" indent="yes"/>
    
   
    <xsl:mode on-no-match="shallow-copy"/>
    
  
    <xsl:template match="text()">

         
                <a href="http://www.historyorb.com/events/date/{.}">
                    <xsl:value-of select="."/>
                </a>
            
      
            <xsl:analyze-string select="." regex="^(\w+):\s*(.*)$">
                <!-- looking for  speaker and speech -->
                <xsl:matching-substring>
                    <line>
                        <!-- Wrap the speaker's name with <speaker> -->
                        <speaker><xsl:value-of select="substring-before(., ':')"/></speaker>
                        <!-- Wrap the speech content with <speech> -->
                        <speech><xsl:value-of select="substring-after(., ':')"/></speech>
                    </line>
                </xsl:matching-substring>
                
                <!-- If no match for dialogue, output the non-matching substring -->
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
            
    </xsl:template>
    
</xsl:stylesheet>
