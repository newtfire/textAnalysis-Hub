# Class Notes from 11/10/21 DIGIT 400
*notes taken by Mia Borgiaaaaa*
## SVG, HTML, and CSS

### Flex Containers!!

- Server-Side Includes (SSI) don't work with PHP pages. *internal screaming*

- Block sections of your site with `<section>` HTML elements, which will be the `flex` containers in your corresponding CSS.

- Big difference between doing the good ol' copy-pasta of your SVG code directly into the HTML versus embedding the SVG as a static image in an `<img>` element.

   #### Pros of copy-pasta-ing SVG code into HTML: 
    - - Retains scaleability of the vector graphics.
    - - allows you to write Javascript that can activate individual parts of the SVG graphic, which gives you the option to make the SVG interactive. As a static image, SVG has limited control over interactive elements.
    -- For example: you can put `@class` and `@id` attributes on your SVG elements to be able to grab them in JS and CSS to trigger actions on groups of vectors or one specific vector representing your data. Endless possibilities.
    
# Splitting your SVG code with your HTML code: 
- svg - output `@xml:id`s as classes or IDs
- HTML - `@xml:id`

### SVG viewBox, preserveAspectRatio, and xmlns (in the `<svg>` top element)

`viewBox`: setting the perspective/proportion of the canvas which contains your SVG

####USE DIS VERY USEFUL ATTRIBUTE IN YOUR `<svg>` ELEMENT:

`preserveAspectRatio="xMinYMin meet"` 

 - this allows the SVG to preserve its aspect ratio while scaling (keeps it nice and pretty)
 
 #### XMLNS attribute code:
 
 `xmlns="http://http://www.w3.org/2000/svg"`

^^USE IT (or not, whatevs) ((but definitely maybe use it))