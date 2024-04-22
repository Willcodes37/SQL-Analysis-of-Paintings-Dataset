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
|name|total|
|--- |--- |
|The Metropolitan Museum of Art|22|
|The Museum of Modern Art|9|
|The State Hermitage Museum|9|
|Philadelphia Museum of Art|8|
|Solomon R. Guggenheim Museum|7|
|The Art Institute of Chicago|6|
|The Tate Gallery|6|
|Thussen-Bornemisza Museum|4|
|National Gallery of Art|2|
|The Prado Museum|1|
|Museum Folkwang|1|
|Los Angeles County Museum of Art|1|


```SQL
-- Query for common art styles in Museums 

select a.style, count(*) as total
from public.artist a
inner join public.work w
	on a.artist_id=w.artist_id
inner join public.museum m
	on w.museum_id=m.museum_id
group by a.style
order by total desc
```

**Result:** 
|style|total|
|--- |--- |
|Impressionist|1017|
|Baroque|641|
|Post-Impressionist|409|
|Rococo|380|
|Realist|297|
|Romantic|213|
|Portraitist|188|
|Marine Art|156|
|Neoclassical|150|
|Expressionist|147|
|Hudson River School|122|
|Nabi|85|
|Orientalist|84|
|Cubist|76|
|Colonial|71|
|Northern Renaissance|59|
|Classicist|53|
|Avant-Garde|51|
|Symbolist|51|
|Pointillist|50|
|High Renaissance|44|
|Landscape Art|40|
|Mannerist|33|
|Renaissance|31|
|Fauvist|28|
|Surrealist|13|
|Early Renaissance|12|
|Naturalist|12|
|Art Nouveau|12|
|Folk|10|
|Modern Art|9|
|Futurist|7|
|Ukiyo-e|1|
|American West|1|

