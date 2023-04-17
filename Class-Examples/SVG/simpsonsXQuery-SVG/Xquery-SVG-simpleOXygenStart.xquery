xquery version "3.1";
(: Simpsons SVG season by season: unfinished. :)
(: start by declaring global variables. These must end with a semicolon ;  :)
declare variable $xSpacer := 5;
declare variable $ySpacer := 20;
declare variable $colors := ("red", "green", "blue", "orange", "black", "purple", "aqua");
declare variable $simpsons_S1 := collection('simpsons/Simpsons_S1/?select=*.xml');
declare variable $simpsons_S10 := collection('simpsons/Simpsons_S10/?select=*.xml');
declare variable $simpsons_S20 := collection('simpsons/Simpsons_S20/?select=*.xml');
declare variable $simpsons_S30 := collection('simpsons/Simpsons_S30/?select=*.xml');
declare variable $simpsonsAll := ($simpsons_S1, $simpsons_S10, $simpsons_S20, $simpsons_S30);
(: In oXygen, adjust the filepath and use ?select=*.xml at the end to read around your schema and computer system files.:)
declare variable $allCatches := $simpsonsAll//catchphrase => distinct-values();
declare variable $distCatches := $simpsonsAll//catchphrase ! normalize-space() ! lower-case(.) ! replace(., "'", '') => distinct-values();

