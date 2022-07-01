from urllib.request import urlopen

url = "http://google.com/"  # search?q=us+news"
# url = "http://reddit.com"
# url = "https://www.bing.com/search?q=us+news"

encoding = "utf-8"

# read url's html
page = urlopen(url)
html_bytes = page.read()
html = html_bytes.decode(encoding)

print(html)
