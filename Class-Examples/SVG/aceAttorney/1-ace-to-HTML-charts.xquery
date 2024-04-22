declare variable $aceColl := collection('corpus-xml/?select=*.xml');
(: ebb: This is global variable syntax. Each variable ends with a semicolon `;`
Global variables are handy to use when you're making HTMl or SVG from XQuery because they 
can be called in any FLWOR you write later in the file. 
They're simply available everywhere in your file. 
:)

(: Look around at some nodes. What do you want to know? :)
declare variable $titles := $aceColl//title;

(: ebb: Let's find all the <cutIn> elements marked by the team. 
We'll use XPath's normalize-space() to return a simple text string and remove spaces. :)
declare variable $cutIns := $aceColl//cutIn ! normalize-space();


(: What are the distinct (unique) values of cutIns? :)

declare variable $distinctCuts := distinct-values($cutIns);


(: See the data we have  on cutIns: :) 
declare variable $survey := 
    for $a in $aceColl
    let $aCuts := $a//cutIn
    let $aCount := count($aCuts)
    let $aTitle := $a//title ! normalize-space()
    order by $aCount descending
    return ($aTitle || '&#x9;' || $aCount || '&#10;');


(: Make an HTML table of cutIns and how often they're used across the collection :)
declare variable $webChart :=
<html>
    <head>
    <title>Table of Cutin Data</title>
    </head>
    <body>
    <table>
    {for $c in $distinctCuts
    let $count := $aceColl//cutIn[normalize-space(.) = $c] => count()
     return 
     <tr>
       <td>{$c}</td>
       <td>{$count}</td>     
     </tr>  
     }
     </table>
     </body>
</html>;

(: What do we want to do with this? 
Let's go through episodes and see which ones feature each cutIn the most. :)


declare variable $webChartEpisode :=
<html>
    <head>
    <title>Table of Cutin Data by Episode</title>
    </head>
    <body>
    <table>
    {for $ep at $pos in $aceColl
    let $epTitle := $ep//title ! normalize-space()
    let $totalcutIns := $ep//cutIn => count()
    where $totalcutIns > 0
    order by $totalcutIns descending
        
     return 
     <tr>
       <td>{$epTitle}</td>
       
       <td>
       {for $c at $cutPos in $distinctCuts
        
        let $epCount := $ep//cutIn[normalize-space(.) = $c] => count()
        return
       
            <ul>
       
          <li>{$c}</li>
          <li>{$epCount}</li>
       </ul>
       }
       </td>
   
     </tr>  
     }
     </table>
     </body>
</html>;

(: We must always call just ONE variable to return in an XQuery file.
When it's a global variable, call it by name very END of the file. :) 
$webChart



