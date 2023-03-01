# Dr. B's Dracula Regex Notes

Do the search and replaces to match paragraphs, headings, and raise up the chapter hierarchy.

Then let's look at the weirdness that is the quoted passages. 

Look for quoted passages with Dot Matches All turned OFF, so they look inside the long-line paragraphs.

Found 1,386 such quotes with matching quotes on each side inside a paragraph line.

Now, what happens if we search with Dot Matches All turned ON, for `".+?"`
What should we do about these 77 items, if this were a real project?


Time: 
Work up from `\d`. Observe the pattern. Can you catch the possibility of A.M. or P.M.? 


