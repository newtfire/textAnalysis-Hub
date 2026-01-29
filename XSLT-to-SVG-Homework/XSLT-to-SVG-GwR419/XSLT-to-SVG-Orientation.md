# XSLT to SVG Orientation

## Orientation
Writing XSLT to plot SVG involves planning for what you need to plot.
You need to plan for some data to "pull" by counting or measuring, something that will yield an interesting number value.

You'll need to study your XML with some XPath (so we'll review how to do that).
In our example here, we want to plot the count of `<special whatsIt="magicEgg">` powerups 
nested as down (as descendants) of the `<blob>` elements.

We can find out with XPath `//blob => count()` that there are three blob elements.

We can find out with XPath that within the blobs,  there are lots of `<special>` elements, 
but only a selection of these have the `@whatsIt="magicEgg"`. 
`//blob/count(special[@whatsIt='magicEgg'])` gives us an idea of what we're working with.

So we decided to plot a purple circle for each count. Study the XSLT file to see how this works.
We'll make some adjustments to this in class!

## Exercise 

Study the way we applied `transform(translate())` to the `<g>` element 
and be sure you understand it.

### Options: 

a) Change this XSLT to plot different kinds of information from our source `Blobs.xml`. Can you plot information about 
*all* the `<special>` elements, or compare the amount of  the other `<special>` elements that are *not*  marked "magicEgg"
to the ones that are? Try plotting this with dfiferent shapes, too. 


b) **Especially if you are brand new to XSLT**, use this exercise to study how tthis code works
to pull information. (You may wish to meet with me or another student from this class who is more familiar with XSLT
to be sure you're setting up the oXYgen XML Editor correctly to write and process this code.)
See if you can draw and label an X and Y axis, and try adjusting this to count something different, 
change the shapes we're drawing, etc.


c) Choose some XML for a project or past homework in DIGIT 110 or 100, and see if you can adapt my code
to pull and plot some interesting data. Your XSLT should apply `<xsl:for-each>` to reach into your plot.


