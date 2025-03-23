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
        detailed="true"
       
    />
    
    <p:for-each>
        
        <p:with-input select="//c:file"/>
        <p:variable name="filename" as="xs:string" select="//c:file/@name ! substring-before(., '.txt')"/>
       
       <p:invisible-xml cx:processor="markup-blitz">
            <p:with-input port="grammar">
                <p:document href="onepieceSimpler.ixml" content-type="text/plain"/>
            </p:with-input>
        </p:invisible-xml>
        <p:identity message="Added markup with ixml"/>
        <p:store name="simple-XML" href="YO-{$filename}.xml"/>
 
    </p:for-each>
   

</p:declare-step>