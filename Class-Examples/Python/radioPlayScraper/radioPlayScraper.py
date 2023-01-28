# 2021-03-03 ebb: I'm adapting a script for downloading videos from GeeksforGeeks.org: https://www.geeksforgeeks.org/downloading-files-web-using-python/
import bs4
import requests
# ebb: will lxml do just as well if not better?

archive_url = "https://emruf.webs.com/"

def get_radioplays():
    # create response object
    r = requests.get(archive_url)

    # create beautiful-soup object
    soup = bs4.BeautifulSoup(r.content, 'html.parser')

    # find all links on web-page
    links = soup.findAll('a')

    # filter the link sending with .mp4
    hrefs = [archive_url + link['href'] for link in links]

    download_links(hrefs)

def download_links(hrefs):
    for href in hrefs:
        # iterate through all links in hrefs
        # and download them one by one

        # obtain filename by splitting url and getting
        # last string
        file_name = href.split('/')[-1]

        print( "Downloading file:%s"%file_name)

        # create response object
        r = requests.get(href, stream = True)

        # download started
        with open(file_name, 'wb') as f:
            for chunk in r.iter_content(chunk_size = 1024*1024):
                if chunk:
                    f.write(chunk)

        print( "%s downloaded!\n"%file_name )

    print ("All radio plays downloaded!")
    return




# ebb: On the line if __name__ == "__main__": , see: https://medium.com/@j.yanming/debugging-from-main-to-main-in-python-fe2a9784b36
if __name__ == "__main__":

    # getting all link to radio play files
    get_radioplays = get_radioplays()

    # download all linked radio play files
    # download_links(hrefs)




