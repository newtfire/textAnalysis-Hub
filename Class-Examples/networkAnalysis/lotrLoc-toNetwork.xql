xquery version "3.1";
(: Example XQuery to output a SIF format for Cytoscape network analysis :)
declare variable $textFileContent := string-join(
    (: For a text output, start with a half-open string-join to bundle the file together  :)
let $lotrLoc := collection('/db/lotrLoc')
let $names := $lotrLoc//name
let $distinctNames := $names ! normalize-space() => distinct-values() => sort()
let $bookTitle := $lotrLoc//title
let $chapter := $lotrLoc//chapter
(: Okay, let's get data on which book-chapters the various names turn up in, 
 : and what kinds of names they are:)
    for $d in $distinctNames
    let $books := $lotrLoc/xml[.//name = $d]
    (: We should splice the book info to the chapter info for these :)
        for $b in $books
            let $bID := $b/@xml:id ! data()
            let $chapters := $b//chapter[.//name ! normalize-space() = $d]
                (: Now we find the connected names in each chapter :)
                for $c in $chapters
                    let $cID := $c/heading ! replace(., 'Chapter ', 'chap') ! ($bID || '-' || .) => string-join("&#x9;")
                    let $connectedNames := $c[.//name ! normalize-space() = $d]//name[not(. ! normalize-space() = $d)]
                    (: This says, find the connected names in the chapter that are NOT the same as the source node:)
                    let $connectedString := $connectedNames => distinct-values() => string-join("&#x9;")
                    (: Taking distinct values to simplify the output :)
                    (: This is a tab character that we use for a separator in preparing the network data:  "&#x9;":)
                    return ($d ||  "&#x9;" || $cID || "&#x9;" || $connectedString), "&#10;");
        (: The string-join that ties the file together wraps up with a line-return at the 
        end of each row with "&#10;" You have to end the global variable with the ; (a semicolon). :)

let $filename := "lotrPlaceOrgNetwork.sif"
let $doc-db-uri := xmldb:store("/db/00-students-00/sampleStudent/", $filename, $textFileContent, "text/plain")
return $doc-db-uri  
  (: output at :http://newtfire.org:8338/exist/rest/db/00-students-00/sampleStudent/lotrPlaceOrgNetwork.sif ) :)    