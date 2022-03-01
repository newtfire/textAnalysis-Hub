# 2021-03-03 ebb: I'm adapting a script for downloading videos from GeeksforGeeks.org: https://www.geeksforgeeks.org/downloading-files-web-using-python/
# 2021-03-06 ebb: On more gnarly web input, we probably want to be using lxml rather than beautiful soup.
# So I'm adapting again from here:
# https://stackoverflow.com/questions/42948160/scraping-with-beautiful-soup-and-python-keyerror-href
import bs4
# ebb: be sure to do pip install lxml (on mac os)
import lxml
from lxml import html
from lxml import etree
import requests
# ebb: will lxml do just as well if not better?

# archive_url = 'https://blueslyrics.tripod.com/bluessongs1.htm'
# archive_url = 'https://blueslyrics.tripod.com/bluessongs2.htm'
# archive_url = 'https://blueslyrics.tripod.com/bluessongs3.htm'
# archive_url = 'https://blueslyrics.tripod.com/bluessongs4.htm'
archive_url = 'https://blueslyrics.tripod.com/bluessongs5.htm'
archiveFileName = archive_url.split('/')[-1]
# print(archiveFileName)

def get_files():
    # create response object
    r = requests.get(archive_url)
    print(r)
    # ebb: Response [200] is good! It means "ok success."
    # access the file with lxml html
    root = html.fromstring(r.content)


    # find all links on web-page
    links = [archive_url.split(archiveFileName)[0] + link.split('#top')[0] for link in root.xpath('//a[not(contains(@href, "http"))][contains(@href, "top")][contains(@href, "lyrics/")]/@href')]

    print(len(links))

    #check url status
    # ebb: From https://elitwilliams.medium.com/check-for-404-rrors-in-bulk-using-this-simple-python-script-and-a-list-of-urls-cf3cf6a97eca
    for link in links:
        try:
            r = requests.get(link)
            print(link + "\tStatus: " + str(r.status_code))
        except Exception as e:
            print(link + "\tNA FAILED TO CONNECT\t" + str(e))


    download_links(links)

def download_links(links):
    for link in links:
        # iterate through all links in hrefs
        # and download them one by one

        # obtain filename by splitting url and getting
        # last string
        file_name = link.split('/')[-1]

        print( "Downloading file:%s"%file_name)

        # create response object
        r = requests.get(link, stream = True)

        # download started
        with open(file_name, 'wb') as f:
            for chunk in r.iter_content(chunk_size = 1024*1024):
                if chunk:
                    f.write(chunk)

        print( "%s downloaded!\n"%file_name )

    print ("All files downloaded!")
    return




# ebb: On the line if __name__ == "__main__": , see: https://medium.com/@j.yanming/debugging-from-main-to-main-in-python-fe2a9784b36
if __name__ == "__main__":

    # retrieving all links to files on a page:
    get_files = get_files()

    # download all linked radio play files
    # download_links(hrefs)




