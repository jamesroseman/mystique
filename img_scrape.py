#! /usr/bin/env python

#  Reddit image scraper
# 
#  ./img_scrape [subreddit] [index]
#
#	- Error if subreddit D.N.E. or contains no images.
#   - Error if index is out of range 
#
#  James Roseman
#  May, 2013

import sys
from urllib2 import urlopen

try:
	import simplejson as json
except ImportError:
	import json

def main (argv):
    if len(argv) != 2:
        print "Usage: ./img_scrape [subreddit] [index]"
        return -1

    url = "http://www.reddit.com/r/" + argv[0]


    if not "json" in url: 
        url += ".json"

    try:
        json_obj = urlopen(url).read()
    except:
        # Instead of breaking, try again.
        main (argv)
        return -1
    img_check = lambda x: (x["data"]["url"].endswith(".jpg") or "imgur" in x["data"]["url"]) and not x["data"]["over_18"]
    img_list = map(lambda x: x["data"]["url"], filter(img_check, json.loads(json_obj)["data"]["children"]))

    try:
        ret = img_list[int(argv[1])]
    except IndexError:
        ret = img_list[0]
    
    if ret.endswith(".jpg"):
        print ret
    else:
        print ret + ".jpg"

if __name__ == "__main__":
	main (sys.argv[1:])
