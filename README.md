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
|name |total |
|--- |--- |
The Metropolitan Museum of Art	22
The Museum of Modern Art	9
The State Hermitage Museum	9
Philadelphia Museum of Art	8
Solomon R. Guggenheim Museum	7
The Art Institute of Chicago	6
The Tate Gallery	6
Thussen-Bornemisza Museum	4
National Gallery of Art	2
The Prado Museum	1
Museum Folkwang	1
Los Angeles County Museum of Art	1

