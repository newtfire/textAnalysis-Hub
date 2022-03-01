# 2021-03-06 ebb: This script is for parsing the bad old HTML in the lyrics files we scraped, to see if we can write
# just the text of the lyrics out into new files.
# The XPaths we want to retrieve are:
#   (//table[@border="0"]//string())[1],
#     //table[@border="0"]/following::text()[not(parent::b)][not(parent::font[@size="-1"])]
#
import os
import bs4
# ebb: be sure to do pip install lxml (on mac os)
import lxml
from lxml import html
from lxml import etree
import io
from io import StringIO, BytesIO
import glob



# archive_url = 'https://blueslyrics.tripod.com/bluessongs1.htm'
path = '../sourceHTM'
lyrDir = os.listdir(path)
print(lyrDir)

for filenames in lyrDir:
    if filenames.endswith(".htm"):
        with open(os.path.join(path, filenames), encoding="utf8", errors='ignore') as file:
            filerename = file.name.split('htm')[0] + "txt"
            print(filerename)
            filename = '../lyrTexts/' + filerename.split('../sourceHTM/')[1]
            # print(filename)
            content = file.read()
            file.close()
            parser = etree.HTMLParser()
            tree = etree.parse(StringIO(content), parser)
            rootParse = etree.tostring(tree.getroot(), pretty_print=True, method="html")
            # print(rootParse)
            stringRoot = str(rootParse, 'UTF-8')
            parsedRoot = etree.parse(StringIO(stringRoot), parser)
            metatitle = parsedRoot.xpath('//title/text()')
            print(metatitle)
            songtitle = parsedRoot.xpath('//table[@border="0"]//text()')
            # print(songtitle)
            converted_songtitle = []
            for wordstuff in songtitle:
                converted_songtitle.append(wordstuff.strip())
            # print(converted_songtitle)
            songtitle2 = [x.replace('\n         ', ' ') for x in converted_songtitle]
            # print(songtitle2)
            songlyrics = parsedRoot.xpath('//table[@border="0"]/following::text()[not(parent::b)][not(parent::font[@size="-1"])]')
            # print(songlyrics)

            newfile = open(filename, "w")
            contents0 = '\n'.join(metatitle)
            contents1 = '\n'.join(songtitle2)
            contents2 = '\n'.join(songlyrics)
            newfile.write(contents0 + contents1 + contents2)
            newfile.close()
