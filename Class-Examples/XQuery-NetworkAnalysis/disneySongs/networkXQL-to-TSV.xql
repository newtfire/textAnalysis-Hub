xquery version "3.1";
declare variable $thisFileContent:=
string-join(
let $disneySongs := collection('/db/disneySongs')
(: See XQuery Ex 3 for a quick representation of the Disney Songs XML code. 
 : For this example, let's try a network of voiceActors and composers based on the movies they appear in, pulled from the XML files. This will be a network of string values drawn via distinct-values.:)
let $voiceActors := $disneySongs//voiceActor ! normalize-space() => distinct-values()
(: First we'll loop through the list of voiceActors, and look up in the disneySongs collection to find the movies they were in :)
for $v in $voiceActors
let $vMovies := $disneySongs[.//voiceActor ! normalize-space() = $v]//movie ! normalize-space() => distinct-values()
(: Now, let's find out the composers who are in the same movies with these. :)
for $m in $vMovies
let $composers := $disneySongs[.//movie ! normalize-space() = $m]//composer ! normalize-space() => distinct-values()
(: Let's study the predicate filters we're putting on the disneySongs collection! These establish the song files that share the current movie we're looping on. :)
for $c in $composers
return  
concat($v(:source node:), "&#x9;"(:tab character:), $m(:shared interaction or edge:), "&#x9;", $c(:target node:)), "&#10;");
$thisFileContent

