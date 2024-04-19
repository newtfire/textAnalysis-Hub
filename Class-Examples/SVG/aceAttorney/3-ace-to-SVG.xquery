(: ebb: Let's have this code generate some SVG instead of HTML! :) 

declare variable $aceColl := collection('corpus-xml/?select=*.xml');
(: Look around at some nodes. What do you want to know? :)
declare variable $titles := $aceColl//title;

(: ebb: Let's find all the <cutIn> elements marked by the team. 
We'll use XPath's normalize-space() to return a simple text string and remove spaces. :)
declare variable $cutIns := $aceColl//cutIn ! normalize-space();
(: For SVG, declare some simple numbers to use for spacing.  :)
declare variable $xSpacer := 100;
declare variable $ySpacer := 150;
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


(: What do we want to do with this? 
Let's go through episodes and see which ones feature each cutIn the most. :)

(: Let's organize our episodes before we start plotting, and throw out all the ones that don't have
cutins. We can sort them from highest to lowest count of cutins. THEN start plotting. 
(Why? It has to do with position ($pos) and how it works in XQuery.) 
:)
declare variable $sortedEpisodesByCutins :=
    for $ep at $pos in $aceColl
    let $epTitle := $ep//Q{}title ! normalize-space()
    let $totalcutIns := $ep//Q{}cutIn => count()
    where $totalcutIns > 0
    order by $totalcutIns descending
    return $ep;
    


declare variable $svgEpisode :=
<svg width="400" height="18000" viewBox="0 0 400 20000" xmlns="http://www.w3.org/2000/svg">
    <desc>Cutin Data by Episode. Let's plot this running DOWN the screen since there are lots of episodes. We'll just use the y values as they 
    accumulate to plot down the screen. </desc>
    
   <g id="wholePlot" transform="translate(50, 50)">
    {for $ep at $pos in $sortedEpisodesByCutins
    let $epTitle := $ep//Q{}title ! normalize-space()
    let $epIdentifier := $ep ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')
    (: base the episode identifier on the filename, and cut off the .xml from the end:)
    let $totalcutIns := $ep//Q{}cutIn => count()
    where $totalcutIns > 0
    order by $totalcutIns descending
        
     return 
 
     
     <g id="{$epIdentifier ! replace(., '[ ,;]', '') ! replace(., '%\d+' ,'')}">
        <desc>Total Cut Ins in this episode? {$totalcutIns}</desc>
      <text x="{$xSpacer + 30}" y="{$pos * $ySpacer - 100}">{$epTitle} : {$totalcutIns}</text>
       
       <g class="cutinInfo">
       <desc> We only have three cutIn lines, so let's plot these for each episode that contains them.
       We could try a stacked bar plot, or just plot them side by side.</desc>
       
       {for $c at $cutPos in $distinctCuts
        
        let $epCount := $ep//Q{}cutIn[normalize-space(.) = $c] => count()
        return
            <g>
            <desc>{$c}, {$epCount}</desc>
          <line x1="{$xSpacer * $cutPos}" x2="{$xSpacer * $cutPos}" 
            y1="{$pos * $ySpacer}" y2="{$pos * $ySpacer - $epCount}" 
            stroke="{$colors[position() = $cutPos]}" stroke-width="20" />
            
               
                <text x="{$xSpacer  * $cutPos}" y="{$pos * $ySpacer - 80}">{$c}</text> 
                 <text x="{$xSpacer * $cutPos}" y="{$pos * $ySpacer - 50}">{$epCount}</text> 
     
 
            </g> }
        </g>
      </g>}
    </g>

</svg>;


(: We must always call just ONE variable to return in an XQuery file.
When it's a global variable, call it by name very END of the file. :) 


$svgEpisode
