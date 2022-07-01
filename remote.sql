--/*
select
    *
from dbt_cody.pings
;
--*/

/*
select
    url,
    avg(length(encoded_html)) as html_length_avg,
    min(length(encoded_html)) as html_length_min,
    max(length(encoded_html)) as html_length_max
from dbt_cody.raw_html
group by url
order by html_length_avg desc
;

select
    url,
    count(pingtime) as ping_count
from dbt_cody.raw_html
group by url
order by ping_count desc
;

select 
    pingtime
from dbt_cody.raw_html
order by pingtime desc
limit 10
;

with abortion as (
    select
        pingtime,
        url,
        encoded_html
    from dbt_cody.raw_html
    where lower(encoded_html) like '%abortion%'
    order by pingtime desc
)

select
    url,
    count(pingtime) as ping_count_with_abortion
from abortion
group by url
order by ping_count_with_abortion desc
;

with roe_or_wade as (
    select
        pingtime,
        url,
        encoded_html
    from dbt_cody.raw_html
    where encoded_html like '%Roe%' or
    encoded_html like '%Wade%'
    order by pingtime desc
)

select
    url,
    count(pingtime) as ping_count_with_roe_or_wade
from roe_or_wade
group by url
order by ping_count_with_roe_or_wade desc
;

with roe as (
    select
        pingtime,
        url,
        encoded_html
    from dbt_cody.raw_html
    where encoded_html like '%Roe%'
    order by pingtime desc
)

select
    url,
    count(pingtime) as ping_count_with_roe
from roe
group by url
order by ping_count_with_roe desc
;

with wade as (
    select
        pingtime,
        url,
        encoded_html
    from dbt_cody.raw_html
    where encoded_html like '%Wade%'
    order by pingtime desc
)

select
    url,
    count(pingtime) as ping_count_with_wade
from wade
group by url
order by ping_count_with_wade desc
;

select 
    pingtime,
    url
from dbt_cody.raw_html
where url = 'http://msn.com'
limit 1
;
--*/
