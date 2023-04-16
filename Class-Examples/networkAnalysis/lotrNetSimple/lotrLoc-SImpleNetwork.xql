xquery version "3.1";
(: ebb: Drafted in newtfire eXist-dB to saveoutput there. Downloaded the XQuery file and output for sharing on the textAnalysis-Hub. :)
(: Example XQuery file to output a TSV for Cytoscape network analysis. Distinct values helps reduce the output. :)
declare variable $ThisFileContent := string-join(
    (: For a text output, start with a half-open string-join to bundle the file together  :)
let $lotrLoc := collection('/db/lotrLoc')
let $names := $lotrLoc//name ! upper-case(.) ! normalize-space() => distinct-values()
(: The next variable returns a concatenated string of name, type as classified by our spaCy NLP tagger, and books the name appears in :)
let $networkString := 
        for $n in $names
        let $bookIDs := $lotrLoc/xml[.//name ! upper-case(.) ! normalize-space() = $n]/@xml:id ! string()
        let $typesLookup := $lotrLoc//name[upper-case(.) ! normalize-space() = $n]/@type ! string() => distinct-values()
        for $b in $bookIDs
            for $t in $typesLookup
        
        
        
        
        return ($n ||  "&#x9;" ||  $t || "&#x9;" || $b || "&#x9;" || 'book') 
 (: Reduce this down with distinct values so we don't have repeats. Simplify as much as possible! :)
return $networkString, "&#10;");


let $filename := "simplerLOTRNet.tsv"
let $doc-db-uri := xmldb:store("/db/00-students-00/sampleStudent/", $filename, $ThisFileContent, "text")
return $doc-db-uri  
  (: output at :http://newtfire.org:8338/exist/rest/db/00-students-00/sampleStudent/simplerLOTRNet.tsv ) :)  