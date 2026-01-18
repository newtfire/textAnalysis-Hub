<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc" exclude-inline-prefixes="#all"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">
    <!--ebb: If you open a default XProc documnt in oXygen, you want to paste in the new stuff for running with Calabash.
        Run in command line over the appropriate directory with calabash onepiece-pipeline.xpl.
    -->
    <p:input port="source"
        primary="true"
        content-types="text/plain"
        href="source/vol-4.txt"/>
 <!-- href attribute points to a local directory path from the XProc file OR to a remote web URL. -->
    <!-- ================================================================ -->
    <!-- No pipeline output; use <p:store> instead                        -->
    <!-- ================================================================ -->
    <p:output port="result" primary="true" sequence="true">
        <p:empty/>
    </p:output>
    <p:identity message="Got some plain text input here ready to process."/>
    <!-- ================================================================ -->
    <!-- Add structural markup with ixml                                  -->
    <!-- Calabash will use Markup Blitz instead of default CoffeePot      -->
    <!--   (input is too large for efficient processing with CoffeePot)   -->
    <!-- ================================================================ -->
    <p:invisible-xml cx:processor="markup-blitz">
        <p:with-input port="grammar">
            <p:document href="onepieceSimpler.ixml" content-type="text/plain"/>
        </p:with-input>
    </p:invisible-xml>
    <p:identity message="Added markup with ixml"/>
    <p:store name="simple-XML" href="onepieceSimple.xml"/>
    <p:identity message="Stored some simple XML made by invisible XML grammar."/>
 
 <p:xslt>
        <p:with-input port="source">
            <p:pipe step="simple-XML" port="result"/>
        </p:with-input>
        <p:with-input port="stylesheet" href="id-transform-regex.xsl"/>
    </p:xslt>
    <p:identity message="Running the Identity Trnasformation XSLT to develop the XML"/>
    <p:store href="onepieceFull.xml" serialization="map {
        'method' : 'xml',
        'indent' : true(),
        'omit-xml-declaration' : false()
        }"/>
    <p:identity message="Saved finalized XML"/>
    <!-- ebb: Later, let's put in a Relax NG, maybe Schematron validation steps here -->
 
</p:declare-step>