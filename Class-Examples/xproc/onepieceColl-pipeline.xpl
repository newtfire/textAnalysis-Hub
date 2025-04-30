<?xml version="1.0" encoding="UTF-8"?>

<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc" exclude-inline-prefixes="#all"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">
    <!--ebb: If you open a default XProc documnt in oXygen, you want to paste in the new stuff for running with Calabash.
        Run in command line over the appropriate directory with calabash onepiece-pipeline.xpl.
    -->


   <p:directory-list name="sourceColl" path="source"
        include-filter="vol-[0-9].txt"
        detailed="true"/>
    
    <p:for-each>
        
        <p:with-input select="//c:file"/>
        <!-- ebb: Don't worry. The above line is NOT a literal filepath. It's just XProc-speak for each individual file in the directory. -->
        <p:variable name="filename" as="xs:string" select="//c:file/@name ! substring-before(., '.txt')"/>
        <p:load href="source/{//c:file/@name}"/>
        <!--ebb: The p:load line ensures that we are importing each text file for processing. -->
       <p:invisible-xml cx:processor="markup-blitz">
            <p:with-input port="grammar">
                <p:document href="onepieceSimpler.ixml" content-type="text/plain"/>
            </p:with-input>
        </p:invisible-xml>
        <p:identity message="Added markup with ixml"/>
        <p:store name="simple-XML" href="ixml-output/{$filename}.xml"/>
       <p:xslt>
            <p:with-input port="source">
                <p:pipe step="simple-XML" port="result"/>
            </p:with-input>
            <p:with-input port="stylesheet" href="id-transform-regex.xsl"/>
        </p:xslt>
        <p:identity message="Running the Identity Trnasformation XSLT to develop the XML"/>
        <p:store href="full-output/{$filename}.xml" serialization="map {
            'method' : 'xml',
            'indent' : true(),
            'omit-xml-declaration' : false()
            }"/>
        <p:identity message="Saved finalized XML"/>
        <!-- ebb: Later, let's put in a Relax NG, maybe Schematron validation steps here -->
 
    </p:for-each>
   

</p:declare-step>