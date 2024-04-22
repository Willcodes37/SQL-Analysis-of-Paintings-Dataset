# SQL-Analysis-of-Paintings-Dataset

#### **Question 1:** What museums have the highest proportion of cubist paintings? What other styles of art do these museums typically display?

```SQL
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
```

**Result:** 
