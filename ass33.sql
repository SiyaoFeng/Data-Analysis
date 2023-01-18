USE mavenfuzzyfactory;

select  pageview_url,
		count(distinct website_session_id)
        
from website_pageviews
where created_at < '2012-06-09'
group by pageview_url
order by 2 desc
