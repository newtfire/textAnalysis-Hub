# Blithedale Steps - EL

Find: ` \n{3,} `

Replace: ` \n\n `
- Fixes blank lines


Find: ` (^\s*\n) `

Replace: ` </p>\n<p> `
- Takes empty lines and puts p tags on them (though the earliest and very LAST tags did need to be manually updated/changed)

Find: ` ^<p>([IVXCML]+)([A-Z]+)(.+?)$\n</p> `

Replace: ` <title>\1\2\3</title> `
- This was my expression to capture the Chapter Title lines and wrap them in title tags. It worked all except for Chapters 1, 5, and 10 (singular Roman Numerals), and those were fixed manually.

Find: ` (</p>)(\n)(<title>) `

Replace: ` </p>\n</chapter>\n<chapter>\n<title> `
- Creates Chapter tags around chapter blocks (using Title tags as identifiers); worked almost perfectly except for manually adding a little at the beginning and end.

Find: ` "(.+?)" ` 

Replace: ` <quote>\1</quote> `
- Takes each of the quotation sections and puts Quote tags around each one.

Find: ` (.+) `

Replace: ` <book>\n\1\n</book> `
- Wraps Book tags around the whole doohickey.



- Manually went through and edited TOC and other extra stuff at the beginning (author, etc.)




