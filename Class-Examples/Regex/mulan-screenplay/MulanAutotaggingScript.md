## Document Analysis and Autotagging the Mulan Script with Regular Expressions

Find: `&` (none)

Find: `<` (none)

Find : `>` (none)

### Wrap the speeches

First, make sure we have even spacing and understand how speeches are lined up.
OBSERVE: Always at least two returns in between every speech or isolated stage direction.
Some stage directions are inside the speeches, and some are solo. 
All stage directions are wrapped in square brackets. 
The difference between a stage direction and a speech? 
Speeches have a name followed by a colon. Stage directions are just wrapped in square brackets.

MOST IMPORTANTLY: the speeches and solo stage directions span multiple lines, 
unlike the Dracula novel(!) We will plan to use the "dot matches all" to capture them.

I went looking for 3 or more newlines to replace them with two:

* Find: `\n{3,}`  (there's just one that's got 3 or more spaces in between)
* Replace: `\n\n`

Turn on "dot matches all". Work with the "don't be greedy" indicator to match 
from the start of a line up to the very first instance of `\n\n`. 

* Find: `^.+?\n\n`
* Set capturing groups in the Find expression: `^(.+?)(\n\n)`
* Replace: `<sp>\1</sp>\2`

NOTE: I decided to keep the two newlines in between to help keep the text easy to read.
ALSO we're tagging EVERYTHING as a `<sp>` element even though many are stage directions
for convenience, and but we can change that later to redo the tags for the solo stage directions.

CHECK to see if speeches aren't separated line by line. This is why we used the "dot matches all" feature, to span across the lines.

### Tag the stage directions
(THINK ABOUT what do we do with "dot matches all"?)

Do we have any stage directions that start in a speech and end outside?
Interesting way to test this: Look for any character that is NOT an angle bracket, to make sure the dot won't include any tags.
Regex for **any character that is not a left angle bracket**: `[^<]`

Try searching: `\[.+?\]` (count 770 results)
Try changing the "dot" to a "not a left-angle bracket": `\[[^<]+?\]`  (count 770 results). So we don't really need to do this.

* Find: `\[(.+?)\]`
* Replace: `<stage>\1</stage>`

### Fix the solo stage directions. 
OBSERVE: These now look like `<sp><stage>.......</stage></sp>`
We need to just remove the `<sp>` tags around that...


### Wrap the speakers names inside each `<sp>`: 
WHAT SHALL WE DO ABOUT "dot matches all"? 
NOTICE how our `<speaker>` element could include a stage direction (which could be okay, if this is our strategy for modeling the document. 
If it isn't okay, can we deal with it using regex (perhaps an extra step or two)?

Potentially useful regular expressions to find **(incomplete hints)**
* Find: `<sp>[^<]+?:`

* Find: `<sp>[^:]+?(?=<st)`

