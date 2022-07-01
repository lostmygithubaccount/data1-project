import re
import os

from datetime import datetime
from urllib.request import urlopen

encoding = "utf-8"

delimiter = "\t"

log_dir = "/tmp"
log_ext = "urllog.csv"
log_file = f"{log_dir}/{str(datetime.now())}.{log_ext}"

script_dir = "/home/cody/data1"

tmp_str = log_file.replace("/", "\/")
sed_str = f"s/<logfile>/{tmp_str}/g"

urls = [
    "http://twitch.tv",
    "https://www.bing.com/search?q=us+news",
    "http://msn.com",
    "https://www.bing.com/search?q=yolo",
    "http://reddit.com",
    "http://youtube.com",
    "https://www.bing.com/search?q=dbt+labs",
    "http://yahoo.com",
    "https://www.bing.com/search?q=microsoft+news",
    "https://www.bing.com/search?q=msft",
    "https://www.bing.com/search?q=google+news",
    "https://www.bing.com/search?q=alphabet+news",
    "https://www.bing.com/search?q=facebook+news",
    "https://www.bing.com/search?q=meta+news",
    "https://www.bing.com/search?q=apple+news",
]

header = f"pingtime{delimiter}url{delimiter}html"

with open(log_file, "w") as f:
    f.write(header)
    for url in urls:
        try:
            # read url's html
            page = urlopen(url)
            html_bytes = page.read()
            html = html_bytes.decode(encoding)

            # write row
            html = html.replace("\t", "\\t").replace("\n", "\\n").replace("\r", "\\r")
            f.write(f"\n{str(datetime.now())}{delimiter}{url}{delimiter}{html}")
        except:
            pass


os.system(f"cp {script_dir}/ingest-template.sql {script_dir}/temp.sql")
os.system(f"sed -i -e '{sed_str}' {script_dir}/temp.sql")
os.system(f"psql -d data1 -f {script_dir}/temp.sql -o {script_dir}/out.txt")
os.system(f"rm {log_dir}/*.{log_ext}")
os.system(f"rm temp.sql")
