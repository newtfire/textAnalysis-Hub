xquery version "3.1";
(: Let's make a network of co-occurrence :)
 (: the speakers who turn up together in the same Avatar episodes.:) 
 (: This network data is very simple: it is intended to output :)
 (: episode titles with character names as two distinct nodes (a bi-modal network):)
declare variable $textFile := 
string-join(
let $avatarEpisodes := collection('/db/avatar/TransformedScripts/')
(: Each episode is the basis of our co-occurence network :)
for $a in $avatarEpisodes
    let $aTitle := $a//metadata/title ! normalize-space()
    let $speakers := $a//speech/@speaker ! normalize-space() => distinct-values()
(: We need to output each speaker on a line of a TSV file for import. Taking distinct values means we just noting that the speaker is present in the episode. :)
    for $s in $speakers
        return 
        concat("episode", "&#x9;", $aTitle, "&#x9;", "character", "&#x9;", $s), "&#10;");
(:  :let $filename := "avatarNetworkData.tsv"
let $doc-db-uri := xmldb:store("/db/2022-ClassExamples", $filename, $textFile, "text/plain")
return $doc-db-uri :)


