<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        
        <!-- trying here to get a list on all the speakers -->
        <xsl:template match="@*">
                <xsl:apply-templates select="@*"/>
        </xsl:template>
        
        <!-- trying to find all the <sp> tags without dialogue and replace with <narration> -->
        <xsl:template match="sp">
                    <narration>
                        <xsl:apply-templates/>
                    </narration>
            <!-- trying to identify all lines of dialogue and wrap the tags around them accurately using regex -->
                    <sp>
                        <xsl:analyze-string select="text()[1]" regex="^(\w+)?\s*">
                            <xsl:matching-substring>
                                <speaker>
                                    <xsl:value-of select="regex-group(1)"/>
                                </speaker>:
                            </xsl:matching-substring>
                            <xsl:non-matching-substring>
                                <xsl:value-of select="."/>
                            </xsl:non-matching-substring>
                        </xsl:analyze-string>
                        <xsl:apply-templates select="info"/>
                    </sp>
        </xsl:template>
        
    </xsl:stylesheet>