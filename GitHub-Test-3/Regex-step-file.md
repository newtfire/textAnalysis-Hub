# Regex Step File

Find `&` 

Replaced with `&amp`

Find `<`  nothing was found

Find `>` nothing was found

Find `\n\n` nothing was found

Find `^.+`

Replaced with `<movie>\0</movie>`

Find `(<movie>)(.+?)\t`

Replaced with `\1<title>\2</title>`

Manually put a root element around the whole thing.

Saved as KyaraParrish-movieData.xml

Opened the XML file back up and got a red square.

I didn't put a `;` after the `&amp`

I replaced all `&amp` with `&amp;`

Got a green square so I know all my code is good.

Saved my work.
