<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" exclude-inline-prefixes="#all"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions" version="3.0">
    <!-- ================================================================ -->
    <!-- Housekeeping-->
    <!-- ================================================================ -->
    <p:input primary="true" port="source" content-types="text" href="source/vol-4.txt"/>
    <p:output primary="true" port="result"/>
    <!-- ================================================================ -->
    <!-- Working steps                                                    -->
    <!-- ================================================================ -->
    <p:invisible-xml>
        <p:with-input port="grammar">
            <p:document href="tag-chapters.ixml" content-type="text/plain"/>
        </p:with-input>
    </p:invisible-xml>
    <p:identity/>
</p:declare-step>
