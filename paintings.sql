-- Query for Museums with cubist paintings 

select m.name, count(*) as total
from public.artist a
inner join public.work w
	on a.artist_id=w.artist_id
inner join public.museum m
	on w.museum_id=m.museum_id
where a.style='Cubist'
group by m.name
order by total desc



-- Query for common art styles in Museums 

select a.style, count(*) as total
from public.artist a
inner join public.work w
	on a.artist_id=w.artist_id
inner join public.museum m
	on w.museum_id=m.museum_id
group by a.style
order by total desc



-- Artist work displayed in different countries

select full_name, count(distinct(country)) as num_of_countries
from public.artist a
inner join public.work w
	on a.artist_id=w.artist_id
inner join public.museum m
	on m.museum_id=w.museum_id
group by a.full_name
having count(distinct(country)) > 1
order by num_of_countries desc



-- Subject and style 

select style_total, ssc.style, subject, style_subject_total, 
	round(((cast(style_subject_total as decimal) / style_total)*100),2) as style_subject_percentage  
from (
select row_number() over (partition by style order by count(*) desc) as row_num, 
	style, subject, 
	count(*) as style_subject_total 
from public.subject s
inner join public.work w
	on s.work_id=w.work_id 
where style is not null 
group by style, subject
order by style, style_subject_total desc 
) as ssc
inner join (
	select style, count(*) as style_total 
	from public.work
	group by style
) as sc
	on ssc.style=sc.style
where row_num=1


