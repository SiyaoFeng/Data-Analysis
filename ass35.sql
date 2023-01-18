


select  ww.pageview_url as first,
		count(distinct tem.website_session_id) as hiting
from website_pageviews ww
right join 

	(select wp.website_session_id,
		min(wp.website_pageview_id) as min
    from website_pageviews wp
where created_at < '2012-06-12'
group by wp.website_session_id ) tem

on tem.min  = ww.website_pageview_id

group by ww.pageview_url

order by hiting


