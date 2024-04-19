(: ebb: Let's have this code generate some SVG instead of HTML! :) 

declare variable $aceColl := collection('corpus-xml/?select=*.xml');
(: Look around at some nodes. What do you want to know? :)
declare variable $titles := $aceColl//title;

(: ebb: Let's find all the <cutIn> elements marked by the team. 
We'll use XPath's normalize-space() to return a simple text string and remove spaces. :)
declare variable $cutIns := $aceColl//cutIn ! normalize-space();
(: For SVG, declare some simple numbers to use for spacing.  :)
declare variable $xSpacer := 300;
declare variable $ySpacer := .5;
declare variable $colors := ("red", "green", "blue");

(: What are the distinct (unique) values of cutIns? :)
declare variable $distinctCuts := distinct-values($cutIns);


(: Make an SVG table of cutIns and how often they're used across the collection :)
(: FOR SVG: SOME SPECIAL PREPARATIONS: 
    1. We use $pos here to return a position number in the for loop. We will use this to
    space the shapes in our SVG plot. 
    2. We also need to call on the Q-name (qualified or local name of an element because we're not writing
     in the SVG namespace but pulling data from no namespace (or the project's namespace if it has one.)
    3. We need to make a viewBox to deal with large numbers, and make some other adjustments with 
    spacing on x and y. 
     :)
declare variable $svgChart :=
<svg width="1000" height="1500" viewBox="0 0 2000 3000" xmlns="http://www.w3.org/2000/svg">
<g id="wholePlot" transform="translate(50, 2000)">
    {for $c at $pos in $distinctCuts
    
    let $count := $aceColl//Q{}cutIn[normalize-space(.) = $c] => count()
     return 
     <g id="cutin-{$pos}"> 
       <line stroke="{$colors[position() = $pos]}" stroke-width="{$xSpacer div 2}" 
       x1="{$xSpacer * $pos}" x2="{$xSpacer * $pos}" y1 = "0" y2="-{$count * $ySpacer}" />
       
        <text font-size="3em" x="{$xSpacer * $pos}" y="50">{$c}</text>
     </g>
     
     }
 </g>
     </svg>   
     ;

(: We must always call just ONE variable to return in an XQuery file.
When it's a global variable, call it by name very END of the file. :) 
$svgChart


