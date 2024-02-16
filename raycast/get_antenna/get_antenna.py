import urllib.request
import json
import os

def get_my_antenna():
	antenna_url = os.environ.get('ANTENNA_URL')
	r = urllib.request.Request(antenna_url)

	with urllib.request.urlopen(r) as response:
		siteNameAndURLs = response.read().decode('utf-8')
		print(json.loads(siteNameAndURLs))

if __name__ == "__main__":
	get_my_antenna()
