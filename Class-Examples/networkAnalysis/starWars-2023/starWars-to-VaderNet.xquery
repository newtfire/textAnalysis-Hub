let $starWarsColl := collection('ner-xml/?select=*.xml')
(: ?select=*.xml : We need this because your local file systems have hidden system files in your directory
that will interfere with XQuery:)

(: Literally open a string-join around the whole FLWOR to unify it in one string and put a hard return character after each output line for the TSV :)
let $wholeNetwork := string-join(
    let $speakers := $starWarsColl//speaker ! lower-case(.) ! normalize-space() => distinct-values()

(: NETWORK APPROACH 1: 
SPEAKER ------ connected by Movie ---- OTHER NAMED ENTITY -- (NER CLASSIFICATION)

(The part in parentheses would be for styling in the network based on type.
In this network, movies would be connecting lines. We could apply color codes to the lines to indicate the different movies in the series. 

We could also do a different kind of network, with the MOVIES as a labelled node, connected to all the named entities based on their types. We'll try that in a new file.
:)

    for $s in $speakers 
        where contains($s, "vader") or contains($s, "anakin")
        
        let $movie := $starWarsColl[.//speaker ! lower-case(.) ! normalize-space() = $s]
        
        for $m in $movie
            let $mTitle := $m ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')
            (: This is the edge connector :)
        
            let $targetSpeakers := $m[.//speaker ! lower-case(.) ! normalize-space() = $s]//speaker[not(lower-case(.) ! normalize-space() = $s )]
            let $targetOtherNames := $m[.//speaker ! lower-case(.) ! normalize-space() = $s]//name 
            
    
    (: Let's concatenate (bundle together) the info and its type (speaker or name type)
    THINK ABOUT: do you want speakers to just be known as PERSON types, equivalent to the NER classification? Or keep them separate because they are speaking agents in the text? That way NER-PERSON classification means people being spoken about. 
    We'll start using the TAB characters here as separators, since we are generating a TSV file (Tab-Separated Values) for Cytoscape)
    
    :) 
    
            let $targetSpk-and-type := for $ts in $targetSpeakers
                               let $tidyName := $ts ! lower-case(.) ! normalize-space()
                               let $concat := ($tidyName || "&#x9;" || "SPEAKER")
                               return $concat => distinct-values()
                               
            let $targetOthers-and-type := for $to in $targetOtherNames 
                                 let $type := $to/@type ! string()
                                 (: Get the NER type from the @type attribute :) 
                                 let $tidyName := $to ! lower-case(.) ! normalize-space()
                                 let $concat := ($tidyName || "&#x9;" || $type)
                                 return $concat => distinct-values()
                                 
    (:Okay: now we bundle the target nodes together. For every target node, we need to produce a new output TSV line. :)
    
        let $allTargets := ($targetSpk-and-type, $targetOthers-and-type)
   
        for $a in $allTargets
            return concat($s (: our speaker :), "&#x9;", "SPEAKER" (: source attribute :), "&#x9;", $mTitle (: our edge connector :), "&#x9;", $a (: itemized target node concatenated with its type:)),  "&#10;")
                              
(: The very last character,  "&#10;" is the hard-return for every line, and it completes the string-join. :)

return $wholeNetwork
                                 

      

