import urllib.request
import json
import os
import sys

def add_antenna():
	args = sys.argv
	if len(args) < 2:
		print("Please provide a URL")
		return 
	article_url = args[1]
	antenna_url = os.environ.get('ANTENNA_URL')
	data = {
    	'url': article_url
	}
	headers = {
		'Content-Type': 'application/json',
	}
	r = urllib.request.Request(antenna_url, json.dumps(data).encode(), headers)
	try:
		urllib.request.urlopen(r)
	except urllib.error.HTTPError as err:
		print(err.code)
	except urllib.error.URLError as err:
		print(err.reason)


if __name__ == "__main__":
	add_antenna()
