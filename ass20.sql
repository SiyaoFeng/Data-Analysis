USE mavenfuzzyfactory;


select
	min(date(created_at)) as week_start_date,
    
    count(distinct case when device_type = 'mobile'then website_session_id else null end ) as mo_session,
    count(distinct case when device_type ='desktop' then website_session_id else null end) as dtop_session
from website_sessions

where utm_source = 'gsearch'
	and utm_campaign = 'nonbrand'
    and created_at >'2012-04-15' and created_at <'2012-06-09'
    
    group by year(created_at), 
			week(created_at)
				