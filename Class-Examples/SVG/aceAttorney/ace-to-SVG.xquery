declare variable $aceColl := collection('corpus-xml/?select=*.xml');
(: ebb: look around at some nodes :)
declare variable $titles := $aceColl//title;
(: ebb: Find all the lines that hold a <cutIn> element :)
declare variable $cutIns := $aceColl//line[cutIn];

(: $cutIns :)

(: What are the distinct (unique) values of cutIns? :)

declare variable $distinctCuts := distinct-values($cutIns);

(: Find out which cutins are used in the most episodes :)

for $d at $pos in $distinctCuts
let $episodes :=  $aceColl//line[contains(., $d )]
let $count := $episodes => count()
where $count > 0
return $count


