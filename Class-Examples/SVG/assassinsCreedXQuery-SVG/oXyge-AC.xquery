<svg xmlns="http://www.w3.org/2000/svg" width="3000" height="1000">
<g>
<text x="60" y="50">How do gameplay actions (orange) vary in relation to number of distinct characters (purple) present in game episodes of Assassin's Creed, Odyssey?</text>
{
let $Xspacer := 70
let $sizer := 5
let $acGame := doc('assassinscreedodyssey.xml')
let $intro := $acGame//Q{}intro
let $chapNums := $acGame//Q{}chapterNum
let $sections := ($intro, $chapNums)

for $s at $pos in $sections
let $actions := $s//Q{}action
let $actionCount := $actions => count()
let $sectionTitle := 
    if ($s//Q{}chapTitles)
        then $s//Q{}chapTitles/string() ! normalize-space()
    else "intro"
       

return 
<g>

<circle cx="{$pos * $Xspacer}" cy="100" r="{$actionCount}" fill="orange"/>

<text x="{$pos * $Xspacer}" y="150" style="writing-mode: tb; glyph-orientation-vertical: 0;">{$sectionTitle}</text>

</g>
}
</g>

</svg>