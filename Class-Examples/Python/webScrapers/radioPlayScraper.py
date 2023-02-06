# 2021-03-03 ebb: I adapted a script for downloading videos from GeeksforGeeks.org: https://www.geeksforgeeks.org/downloading-files-web-using-python/
# Before beginning, you will need to do some pip installs at the command line:
# go out to your shell (Git Bash or Terminal) and enter:
# pip install BeautifulSoup4

import bs4
import requests
# ebb: will lxml do just as well if not better?

archive_url = "https://emruf.webs.com/"
# Sadly, this site no longer exists. But I'm glad I was able to pull the
# collection of radio plays from it, so we can use them in DIGIT 100 class!
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
    print("All radio plays downloaded!")
    # When the download_links() function completes its work,
    # this line will print.

def download_links(hrefs):
# Unlike in the grimmScraper file, I did not try to control where the output was stored.
# To do that, adapt the script from grimmScraper
    for href in hrefs:
        # iterate through all links in hrefs
        # and download them one by one

        # obtain filename by splitting url and getting
        # last string
        file_name = href.split('/')[-1]

        print("Downloading file: " + file_name)

        # create response object
        r = requests.get(href, stream = True)

        # If you want to send the output to a specific file directory, you will
        # want to uncomment and adapt this code:
        # workingDir = os.getcwd()
        #     print("current working directory: " + workingDir)
        #     fileDeposit = os.path.join(workingDir, 'YOUR-OUTPUT-FILE-DIRECTORY', file_name)
        #     print(fileDeposit)

        # download started
        with open(file_name, 'wb') as f:
            for chunk in r.iter_content(chunk_size = 1024*1024):
                if chunk:
                    f.write(chunk)

        print("downloaded " + file_name)
    return

# ebb: On the line if __name__ == "__main__": , see: https://medium.com/@j.yanming/debugging-from-main-to-main-in-python-fe2a9784b36
if __name__ == "__main__":

    # getting all link to radio play files
    get_radioplays = get_radioplays()




