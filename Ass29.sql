USE mavenfuzzyfactory;


select 
	ws.device_type,
    count(distinct ws.website_session_id) as sessions,
    count(distinct o.order_id) as orders,
    count(distinct o.order_id) / count(distinct ws.website_session_id)  as cvr
from website_sessions ws
left join orders o 
on ws.website_session_id = o.website_session_id

where ws.created_at < '2012-05-11' 
	and ws.utm_source ='gsearch'
    and ws.utm_campaign = 'nonbrand'
group by 
	1
        