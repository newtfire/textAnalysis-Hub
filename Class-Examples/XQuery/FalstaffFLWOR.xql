xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
(: In newtfire's eXist-dB use this collection address: 
let $shakes := collection('/db/apps/shakespeare/data/')  :)
(: If you save in oXygen, and you save your XQuery file directly above the shakespeare folder, 
below is how to address the collection :)
let $shakes := collection('shakespeare/data/')
let $falstaffPlays := $shakes//TEI[descendant::speaker = "Falstaff"]
let $fplayTitles := $falstaffPlays//titleStmt/title ! string()
for $fplay in $falstaffPlays
   let $fplayTitle := $fplay//titleStmt/title ! string()
   let $fspeeches := $fplay//sp[child::speaker = "Falstaff"]
   let $count := $fspeeches => count()
   let $linefeed := "&#10;"
   where $count gt 3
   order by $count ascending
   return concat($fplayTitle, ": Falstaff speaks ", $count, " times. ", $linefeed)