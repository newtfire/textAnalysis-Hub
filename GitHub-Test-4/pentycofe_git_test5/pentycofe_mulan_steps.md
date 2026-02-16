# Steps

1. I used (\r?\n){2,} and replaced \n\n to create spaces around the text chunks
1. Then I used (?s)(?:\r?\n){0,1}(.+?)(?=\r?\n\r?\n|$) and <sp> $1 </sp> te wrap each text chunck
1. Then i used ^([A-Za-z0-9#\s.-]+(\s\[[^\]]+\])?): and <speaker>\1</speaker> to wrap speaker tags around  the speakers
