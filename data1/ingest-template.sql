copy dbt_cody.raw_html 
from '<logfile>'
delimiter E'\t'
quote E'\b'
csv
header
;
