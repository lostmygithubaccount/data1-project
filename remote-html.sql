with temp as (
    select
        pingtime,
        url,
        encoded_html
    from dbt_cody.raw_html
    where encoded_html like '%abortion%' and
    url like '%msft%'
    order by pingtime desc
)

select
    encoded_html
from temp
limit 4
;
