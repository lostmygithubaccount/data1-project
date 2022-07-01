select
    pingtime,
    url
from dbt_cody.raw_html
order by pingtime desc
;
