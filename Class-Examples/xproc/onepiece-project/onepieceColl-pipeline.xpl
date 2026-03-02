<?xml version="1.0" encoding="UTF-8"?>

<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">
    <!--ebb: If you open a default XProc documnt in oXygen, you want to paste in the new stuff for running with Calabash.
        Run in command line over the appropriate directory with calabash onepiece-pipeline.xpl.
    -->
    <!-- ================================================================ -->
    <!-- THIS PIPELINE TAKES MULTIPLE INPUT FILES FROM A DIRECTORY AND RUNS THEM THROUGH INVISIBLE XML AND XSLT STEPS AS SCRIPTED. -->
    <!-- ================================================================ -->
    <p:directory-list name="sourceColl" path="source" include-filter="vol-[0-9].txt" detailed="true"/>
    <!-- This is the path to your collection directory and you will probably need to adjust this. 
        If you want to filter to include only certain kinds of filenames
    in that directory, you can apply something like: include-filter="vol-[0-9].txt"  or exclude-filter="something".
    Details: https://xprocref.org/3.1/p.directory-list.html 
    -->

    <p:for-each>
        <!-- ================================================================ -->
        <!-- With <p:for-each> each individual file from the directory starts flowing into the pipeline. 
       You can output a message that you'll see in the shell when this runs. -->
        <!-- ================================================================ -->
        <p:with-input select="//c:file"/>
        <!-- ebb: Don't worry. The above line is NOT a literal filepath. It's just XProc-speak for each individual file in the directory. -->
        <p:variable name="filename" as="xs:string"
            select="//c:file/@name ! substring-before(., '.txt')"/>
        <p:load href="source/{//c:file/@name}"/>
        <!--ebb: This is very weird in the land of XProc, but //c:file/@name 
            literally retrieves the filename you're currently processing.
            The p:load line ensures that we are importing each text file for processing. -->
        <p:identity message="Yo! Got some plain text input here ready to process!"/>
        <!-- ================================================================ -->
        <!-- Next we add structural markup with ixml.                                  -->
        <!-- By setting @cx:processor to markup-blitz,  Calabash will use blitz instead of default coffeePot! -->
        <!-- (Our input is too large for efficient processing with coffeePot.)   -->
        <!-- As of now (version 28) oXygen will flag <p:invisible-xml> as an error. 
        Don't worry. It's not!  -->
        <!-- ================================================================ -->
        <p:invisible-xml cx:processor="markup-blitz">
            <p:with-input port="grammar">
                <p:document href="onepieceSimpler.ixml" content-type="text/plain"/>
                <!-- The value of @href needs to be the filepath to your Invisible XML file. -->
            </p:with-input>
        </p:invisible-xml>
        <p:identity message="Added markup with ixml"/>
        <!-- ================================================================ -->  
        <!-- Now let's store the output in a file in the same directory with this XProc file.  -->
        <!-- ================================================================ -->
        <p:store name="simple-XML" href="ixml-output/{$filename}.xml"/>
        <!-- {$filename} is the filename variable drawn from your source text,
            so you'll see output for each input text that comes through this pipeline. -->
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
            <p:with-input port="stylesheet" href="xslt/ixmlOut-to-TEI.xsl"/>
            <!-- The value of @href needs to be the filepath to your XSLT transformation file for this step in the pipeline. -->
        </p:xslt>
        <p:identity message="Running the Identity Trnasformation XSLT to develop the XML"/>
        <!-- What you see in the p:store after the XSLT step basically sets the XSLT output details. 
    Here we are specifying that we want XML output (we would use the same for SVG). If you 
    go to make HTML output, then set 'method': 'xhtml'. -->
        <!-- As with other steps, adjust the @href value to make sure each output file is stored where you want it to go.  -->
        <p:store href="full-output/{$filename}.xml" serialization="map {
            'method' : 'xml',
            'indent' : true(),
            'omit-xml-declaration' : false()
            }"/>
        <p:identity message="Saved finalized XML"/>
        <!-- ebb: Later, let's put in a Relax NG, maybe Schematron validation steps here -->

    </p:for-each>


</p:declare-step>
