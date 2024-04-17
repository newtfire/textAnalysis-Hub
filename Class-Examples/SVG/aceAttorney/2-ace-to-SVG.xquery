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

(: What do we want to do with this? 
Let's go through episodes and see which ones feature each cutIn the most. :)


declare variable $svgEpisode :=
<svg width="50000" height="1500" viewBox="0 0 2000 3000" xmlns="http://www.w3.org/2000/svg">
    <desc>Cutin Data by Episode</desc>
   <g id="wholePlot" transform="translate(50, 2000)">
    {for $ep at $pos in $aceColl
    let $epTitle := $ep//Q{}title ! normalize-space()
    let $totalcutIns := $ep//Q{}cutIn => count()
    where $totalcutIns > 0
    order by $totalcutIns descending
        
     return 
     
    <g id="{$epTitle}">
     
      <text font-size="2em" x="{$xSpacer * $pos}" y="50">{$epTitle}</text>
       
       <g class="cutinInfo">
       <!--ebb: We only have three cutIn lines, so let's plot these for each episode that contains them.
       We could try a stacked bar plot, or just plot them side by side.
       -->
       {for $c at $cutPos in $distinctCuts
        
        let $epCount := $ep//Q{}cutIn[normalize-space(.) = $c] => count()
        return
            <g>
            <desc>
                {$c}, 
            {$epCount}
          </desc>
          <line stroke="{$colors[position() = $cutPos]}" x1="{$pos * $xSpacer + $cutPos}" x2="{$pos * $xSpacer}" y1="0" y2="{$epCount}"/>
   `        <!--  ebb: Notice how I'm just adding the $cutPos value to the regular x value for the episode here. 
               We can do something different to try to stack these bars on top of each other instead
               of plotting them side by side
               
               WHERE TO PUT THE TEXT OF THE CUT-INS RELATIVE TO THESE THREE LINES?
                <text font-size="3em" x="{$xSpacer * $pos}" y="50">{$c}</text> -->
     
 
            </g> }
        </g>
      </g>}
    </g>

</svg>;


(: We must always call just ONE variable to return in an XQuery file.
When it's a global variable, call it by name very END of the file. :) 
$svgEpisode


