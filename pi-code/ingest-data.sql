copy dbt_cody.raw_html 
--from '/etc/data1/2022-06-25 22:09:24.240661.log'
from '/tmp/test.csv'
delimiter E'\t'
quote E'\b'
csv
header
;
