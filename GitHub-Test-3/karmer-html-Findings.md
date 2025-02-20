# Things I Found out in HTML

I'm also taking Digit 100 along with this during the same semester. So I've logged some html code to do various things in a file.
### Inserting a Video
```
<video controls="controls"> <source src="file/video-name.mp4" type="video/mp4"/></video>
```
This is code for inserting a .mp4 formatted video located in a folder next to your html file. oXygen can help you select one if it notices what you're doing.

### Style Edits for Text

1. style="width:X%;height:X%" 

(Replace X with a number to squash, stretch, and resize something within the file)

1. style="background:X"

(Replace X with a color such as "red" or "black" or a hex like "#d889fa")
1. style="color:X"

(Replace X with a color such as "red" or "black" or a hex like "#000000")

You can also combine styles into one attribute seen here:
```
<p style="background:black;color:white;width:25%;height:25%">
```
There's probably another/better way to do that. I just haven't gotten around to that yet.