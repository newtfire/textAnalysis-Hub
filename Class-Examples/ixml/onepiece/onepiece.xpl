<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" exclude-inline-prefixes="#all"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions" version="3.0">
    <!-- ================================================================ -->
    <!-- Housekeeping-->
    <!-- ================================================================ -->
    <p:input primary="true" sequence="false" port="source" content-types="text"
        href="source/vol-4.txt"/>
    <p:output primary="true" sequence="false" port="result" serialization="map {
            'method' : 'xml',
            'indent' : true()
        }"/>
    <!-- ================================================================ -->
    <!-- Working steps                                                    -->
    <!-- ================================================================ -->
    <!-- Add basic XML markup, including chapter divisions                -->
    <!-- Distinguish chapter header lines from other chapter lines        -->
    <!-- No distinction yet between speech and aside ("extra stuff")      -->
    <!-- ================================================================ -->
    <p:invisible-xml>
        <p:with-input port="grammar">
            <p:document href="tag-chapters.ixml" content-type="text/plain"/>
        </p:with-input>
    </p:invisible-xml>
    <!-- ================================================================ -->
    <!-- Distinguish <sp> from <aside>, tag both                          -->
    <!-- ================================================================ -->
    <p:xslt>
        <p:with-input port="stylesheet" href="tag-speech.xsl"/>
    </p:xslt>
</p:declare-step>
