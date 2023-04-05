let $starWarsColl := collection('ner-xml/?select=*.xml')
(: ?select=*.xml : We need this because your local file systems have hidden system files in your directory
that will interfere with XQuery:)
let $names := $starWarsColl//name ! lower-case(.) ! normalize-space() => distinct-values()
let $speakers := $starWarsColl//speaker ! lower-case(.) ! normalize-space() => distinct-values()

for $s in $speakers 
    let $movie := $starWarsColl[.//speaker ! lower-case(.) ! normalize-space() = $s] ! base-uri()
    let $movieTrimmed := $movie ! tokenize(., '/')[last()]
    (: This is my edge connector :)
    let $targetSpeakers := $starWarsColl[.//speaker ! lower-case(.) ! normalize-space() = $s]//speaker[not(lower-case(.) ! normalize-space() = $s )]
    let $targetOtherNames := $starWarsColl[.//speaker ! lower-case(.) ! normalize-space() = $s]//name 
    
    let $distinctSpeakers := $targetSpeakers ! lower-case(.) ! normalize-space() => distinct-values()
    let $distinctOtherNames := $targetOtherNames ! lower-case(.) ! normalize-space() => distinct-values()
    
    
    
    

return $distinctOtherNames