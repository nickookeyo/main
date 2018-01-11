"""
On windows platform, you have 2 choices:

In a command line terminal, type

c:\python23\python xxxx.py
Open the python editor IDLE from the menu, and open xxxx.py, then press F5 to run it.
For your posted code, the error is at this line:

def main(url, out_folder="C:\asdf\"):
It should be:

def main(url, out_folder="C:\\asdf\\"):
"""

"""
dumpimages.py
Downloads all the images on the supplied URL, and saves them to the
specified output file ("/test/" by default)

Usage:
    python dumpimages.py http://example.com/ [output]
"""

from BeautifulSoup import BeautifulSoup as bs
import urlparse
from urllib2 import urlopen
from urllib import urlretrieve
import os
import sys

def main(url, out_folder="C:\asdf\"):
    """Downloads all the images at 'url' to /test/"""
    soup = bs(urlopen(url))
    parsed = list(urlparse.urlparse(url))

    for image in soup.findAll("img"):
        print "Image: %(src)s" % image
        filename = image["src"].split("/")[-1]
        parsed[2] = image["src"]
        outpath = os.path.join(out_folder, filename)
        if image["src"].lower().startswith("http"):
            urlretrieve(image["src"], outpath)
        else:
            urlretrieve(urlparse.urlunparse(parsed), outpath)

def _usage():
    print "usage: python dumpimages.py http://example.com [outpath]"

if __name__ == "__main__":
    url = sys.argv[-1]
    out_folder = "/test/"
    if not url.lower().startswith("http"):
        out_folder = sys.argv[-1]
        url = sys.argv[-2]
        if not url.lower().startswith("http"):
            _usage()
            sys.exit(-1)
    main(url, out_folder)
