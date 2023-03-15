declare default element namespace "http://www.tei-c.org/ns/1.0";
let $shakes := collection('shakespeare-plays/?select=*.xml')
let $speakers := collection('shakespeare-plays/?select=*.xml')//sp/@who ! string() => distinct-values()
for $s in $speakers
let $count := $shakes//sp[@who = $s] => count()
order by $count descending
return ($s || ' : ' || $count || '&#10;')