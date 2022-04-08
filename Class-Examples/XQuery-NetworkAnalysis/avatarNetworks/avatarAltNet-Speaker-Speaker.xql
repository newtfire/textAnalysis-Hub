xquery version "3.1";
(: Let's make a network of co-occurrence :)
 (: Here is an alternative data structure for our network of speakers in the Avatar series.:)
 (: This time, we seek to show only the characters who are connected by episode, without :)
 (: showing the episode titles in the network. Here, the episode information is output as a :)
 (: connector between two nodes: :)
 (: Source Node: speaker:: EdgeConnector: episode title, Target Node: Each other speaker in the episode. :)
declare variable $textFile := 
string-join(
let $avatarEpisodes := collection('/db/avatar/TransformedScripts/')
(: In this version of the network, we start with Source nodes as a sequence of all distinct speakers throughout the series. :)
let $speakers := $avatarEpisodes//speech/@speaker ! normalize-space() => distinct-values()
for $s in $speakers
   let $episodeMatches := $avatarEpisodes[.//speech/@speaker ! normalize-space() = $s]
(: Sometimes I like to call this a "treeWalker variable": It walks the whole tree of our collection :)
(: and goes filtering it based on whether a file in the collection . :)
 let $sTitles := $episodeMatches//metadata/title ! normalize-space()
(: Figure that speakers can appear in multiple episodes, so we have multiple titles to output. :)
        for $t in $sTitles
        let $oSpeakers := $episodeMatches//speech[not(@speaker ! normalize-space() = $s)]/@speaker ! normalize-space() => distinct-values()
        (:This variable is going to collect every other distinct speaker in each episode, besides the current one we're on.:)
            for $o in $oSpeakers
 (: We need to output each speaker on a line of a TSV file for import. Taking distinct values means we just noting that the speaker is present in the episode. :)

return 
    concat("SourceSpeaker", "&#x9;", $s, "&#x9;", "episode", "&#x9;", $t, "&#x9;", "otherCharacter", "&#x9;", $o), "&#10;");

let $filename := "avatarSpeaker-to-Speaker.tsv"
let $doc-db-uri := xmldb:store("/db/2022-ClassExamples", $filename, $textFile, "text/plain")
return $doc-db-uri 


