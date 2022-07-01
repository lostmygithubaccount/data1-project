select 
    url,
    count(pingtime)
from {{ source('dbt_cody', 'raw_html') }}
group by url
order by url asc