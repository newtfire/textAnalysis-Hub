declare variable $bojack := collection("../xmlFile/outputXML/?select=*.xml");
(: CAUTION: ABOVE IS A RELATIVE FILE PATH DESIGNED FOR WORKING IN oXYGEN ON YOUR LOCAL COMPUTER.
IT READS UP ABOVE THE PARENT DIRECTORY OF THIS XQUERY FILE, and DOWN INTO FILES IT NEEDS IN A PROJECT.
:)

declare variable $colors := ("lightblue", "lightgreen", "blue", "green", "lightpink");
declare variable $xSpacer := 5;
declare variable $ySpacer := 50;

(: These are the different kinds of name types to look for :)


declare variable $allNames := $bojack//name/@type => distinct-values();

declare variable $nameTotal := $bojack//name/@type => count();
(: ebb: Note: The line above gets the count of all type attributes on names including duplicates. 
And yes, this is the value you want to use, and it works. We learn that 82% of the names are persons.
:)


(:I want to find how many distinct strings come up matching to each name Type :)




<svg
    width="100%"
    height="100%"
    xmlns="http://www.w3.org/2000/svg">
    
    
    <g
        transform="translate(200, 700)">
      
        
        {
            for $n at $pos in $allNames
            let $countType := $bojack//Q{}name[@type=$n]/@type => count()
            
            
            let $namePerc := $countType div $nameTotal * 100
            
            let $perc := $namePerc => format-number('01%') 
           
          
            
            
    
(: This is going to have it travel to the bojack collection, look for every name attribute and 
cycle through $n type for the attribute. Then it will travel to the attribute and count what kind of 
attribute it is. :)


(: Look to output percentage type (Add everything up then divide it by how much it appears) :)


            return
                <g
                    id="{$n}">
    
                    <line
                        x1='{0}'
                        y1='{$pos * $ySpacer}'
                        x2='{$xSpacer * $namePerc}'
                        y2="{$pos * $ySpacer}"
                        stroke='{$colors[position() = $pos]}'
                        stroke-width='20'/>
                        
                     <text 
                        x="-100"
                        y="{$pos * $ySpacer}"
                        stroke="black"
                        >
                        {$n}
               
                        </text>
                  
                
                
                </g>
        }
        
        
          
       <line 
            x1="0"
            y1="{6 * $ySpacer}"
            x2="{100 * $xSpacer}"
            y2="{6 * $ySpacer}"
            stroke="black"
            stroke-width ="3"
       />
       <!-- X axis -->
         <line 
            x1="0"
            y1="{6 * $ySpacer}"
            x2="0"
            y2="{0}"
            stroke="black"
            stroke-width ="3"
       />
        <!-- Y axis -->
        
           { for $i at $pos in (1 to 5)
    return
        <line 
            x1="{2 * $pos * $xSpacer * 10}"
            y1="{7 * $ySpacer}"
            x2="{2 * $pos * $xSpacer * 10}"
            y2="{5 * $ySpacer}"
            stroke="green"
            stroke-width ="1"
       />
    
    
    
    
    }
        
        
    </g>
    
    
 
    
    

</svg>

