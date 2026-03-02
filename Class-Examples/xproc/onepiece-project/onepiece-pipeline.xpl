<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">
    <!--ebb: If you open a default XProc document in oXygen, you want to paste in the new stuff for running with Calabash.
        Run in command line over the appropriate directory with calabash onepiece-pipeline.xpl.
    -->
    <!-- ================================================================ -->
    <!-- THIS PIPELINE BEGINS WITH A SINGLE INPUT FILE AND TRANSFORMS IT IN A SERIES OF STEPS. -->
    <!-- ================================================================ -->
    <p:input port="source" primary="true" content-types="text/plain" href="source/vol-4.txt"/>
    <!-- href attribute points to a local directory path from the XProc file OR to a remote web URL. -->
    <!-- ================================================================ -->
    <!-- Here the input starts flowing into the pipeline. We'll output a message that you'll see in the shell when
    this runs. -->
    <!-- ================================================================ -->
    <p:identity message="Got some plain text input here ready to process."/>
    <!-- ================================================================ -->
    <!-- Add structural markup with ixml                                  -->
    <!-- Calabash will use Markup Blitz instead of default CoffeePot!      -->
    <!-- (Our input is too large for efficient processing with CoffeePot.)   -->
    <!-- As of now (version 28) oXygen will flag <p:invisible-xml> as an error. 
        Don't worry. It's not!  -->
    <!-- ================================================================ -->
    <p:invisible-xml cx:processor="markup-blitz">
        <p:with-input port="grammar">
            <p:document href="onepieceSimpler.ixml" content-type="text/plain"/>
        </p:with-input>
    </p:invisible-xml>
    <p:identity message="Added markup with ixml"/>
    <!-- ================================================================ -->  
    <!-- Now let's store the output in a file in the same directory with this XProc file.  -->
    <!-- ================================================================ -->
    <p:store name="simple-XML" href="onepieceSimple.xml"/>
    <p:identity message="Stored some simple XML made by invisible XML grammar."/>
    <!-- ================================================================ -->
    <!-- Next is an XSLT transformation step. -->
    <!-- ================================================================ -->
    <p:xslt>
    <!-- We found we did not need to specify the <p:with-input> line below, because 
    if we do not specify an input we make an "implicit connection" to process the result of the
    previous step. We're just commenting it out in case you ever want to use it. You might want 
    someday want to specify a *different* input port than the immediately preceding one. -->
    <!--    <p:with-input port="source">
            <p:pipe step="simple-XML" port="result"/>
        </p:with-input>-->
        <p:with-input port="stylesheet" href="id-transform-regex.xsl"/>
    </p:xslt>
    <p:identity message="Yay! Running the Identity Transformation XSLT to develop the XML"/>
    <!-- What you see in the p:store after the XSLT step basically sets the XSLT output details. 
    Here we are specifying that we want XML output (we would use the same for SVG). If you 
    go to make HTML output, then set 'method': 'xhtml'. -->
    <p:store href="onepieceFull.xml" serialization="map {
        'method' : 'xml',
        'indent' : true(),
        'omit-xml-declaration' : false()
        }"/>
    <p:identity message="Saved finalized XML"/>
    <!-- ebb: Later, let's put in a Relax NG, maybe Schematron validation steps here -->

</p:declare-step>
