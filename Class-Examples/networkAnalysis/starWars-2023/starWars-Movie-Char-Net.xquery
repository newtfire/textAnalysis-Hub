(: NETWORK APPROACH 2: 
ANY NAME  -- (CLASSIFICATION) ------ connection to ---- MOVIE

(The part in parentheses would be for styling in the network based on type.
In this network, movies would be connecting lines. We could apply color codes to the lines to indicate the different movies in the series. 

We could also do a different kind of network, with the MOVIES as a labelled node, connected to all the named entities based on their types. We'll try that in a new file.
:)

let $starWarsColl := collection('ner-xml/?select=*.xml')
(: ?select=*.xml : We need this because your local file systems have hidden system files in your directory
that will interfere with XQuery:)

let $speakers := $starWarsColl//speaker ! lower-case(.) ! normalize-space() => distinct-values()
let $names := $starWarsColl//name ! lower-case(.) ! normalize-space() => distinct-values()

    
    let $speakersConcat := for $s in $speakers
                               let $movies := $starWarsColl[.//speaker ! lower-case(.) ! normalize-space() = $s]
                               for $m in $movies
                                    let $mCode := $m ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')
                                    let $concat := ($s || "&#x9;" || "SPEAKER" || "&#x9;"|| $mCode || "&#x9;" || "movie")
                                    return $concat => distinct-values()
                               
   (:  ebb: I get Java Heap space problem processing these in oXygen, so commenting out for now :)
   let $namesConcat := for $n in $names 
                                 let $movies := $starWarsColl[.//name ! lower-case(.) ! normalize-space() = $n]
                                 let $type := "MENTIONED"
                                 for $m in $movies
                                    let $mCode := $m ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')
                                    let $concat := ($n || "&#x9;" || $type || "&#x9;" || $mCode || "&#x9;" || "movie")
                                    return $concat => distinct-values() 
                                    
                                 
                                    
                                    
   let $allRows := ($speakersConcat, $namesConcat)
   
   let $string-join := string-join($allRows,  "&#10;")
   return $string-join
                                 
   
