# SQL-Analysis-of-Paintings-Dataset

#### Question 1: What museums have the highest proportion of cubist paintings? What other styles of art do these museums typically display?

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


#### Question 2: Which artists have their work displayed in museums in many different countries?

```SQL
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
```

**Result:**

|full_name|num_of_countries|
|--- |--- |
|Vincent Van Gogh|8|
|Paul Gauguin|7|
|Claude Monet|7|
|Rembrandt Van Rijn|6|
|Pierre-Auguste Renoir|6|
|Francois Boucher|6|
|Leonardo Da Vinci|5|
|André Derain|5|
|Édouard Vuillard|5|
|Peter Paul Rubens|5|
|Francisco De Goya|5|
|El Greco|5|
|Alfred Sisley|5|
|Camille Pissarro|5|
|Frans Hals|5|
|Edgar Degas|5|
|Ludolf Backhuysen|4|
|Claude Lorrain|4|
|John Singer Sargent|4|
|Johannes Vermeer|4|
|Sir Anthony Van Dyck|4|
|Jean-Honoré Fragonard|4|
|Édouard Manet|4|
|Edvard Munch|4|
|Jean-Baptiste-Siméon Chardin|4|
|Jean-Baptiste-Camille Corot|4|
|Henri Rousseau|4|
|Willem Claesz. Heda|4|
|Eugène-Louis Boudin|4|
|Félix Vallotton|4|
|Simon Vouet|4|
|Henri Fantin-Latour|4|
|Henri De Toulouse-Lautrec|4|
|Hans Holbein|4|
|Francisco De Zurbarán|4|
|George Romney|4|
|Sir Joshua Reynolds|4|
|Bartolomé Esteban Murillo|4|
|Wassily Kandinsky|4|
|Pierre Bonnard|4|
|Canaletto|4|
|Caravaggio|4|
|Caspar David Friedrich|4|
|Paul Cézanne|4|
|Winslow Homer|3|
|Aelbert Cuyp|3|
|Albrecht Durer|3|
|Amedeo Modigliani|3|
|Anton Raphael Mengs|3|
|August Macke|3|
|Berthe Morisot|3|
|Diego Velázquez|3|
|Élisabeth Vigée-LeBrun|3|
|Eugène Delacroix|3|
|Ferdinand Bol|3|
|Fernand Léger|3|
|Francois-Hubert Drouais|3|
|Francois Gérard|3|
|Franz Marc|3|
|Franz Xavier Winterhalter|3|
|Georges Seurat|3|
|Gerard Ter Borch|3|
|Gerard Van Honthorst|3|
|Gilbert Stuart|3|
|Gustave Caillebotte|3|
|Gustave Courbet|3|
|Gustave Moreau|3|
|Gwen John|3|
|Hendrick Avercamp|3|
|Henri Manguin|3|
|Jacques-Louis David|3|
|James McNeill Whistler|3|
|James Tissot|3|
|Jan Both|3|
|Jean-Baptiste Greuze|3|
|Jean-Baptiste Oudry|3|
|Jean-Francois Millet|3|
|Jean-Léon Gérôme|3|
|Jean Auguste Ingres|3|
|John Singleton Copley|3|
|Joseph M. W. Turner|3|
|Lucas Cranach|3|
|Maurice De Vlaminck|3|
|Nicolas Poussin|3|
|Odilon Redon|3|
|Paul Signac|3|
|Philippe De Champaigne|3|
|Pierre Puvis De Chavannes|3|
|Pieter Claesz|3|
|Pieter De Hooch|3|
|Robert Delaunay|3|
|Roger De La Fresnaye|3|
|Rosa Bonheur|3|
|Salvador Dalí|3|
|Sandro Botticelli|3|
|Sansio Raphael|3|
|Simon De Vlieger|3|
|Sir Lawrence Alma-Tadema|3|
|Théodore Géricault|3|
|Thomas Gainsborough|3|
|Titian|3|
|Jan Van Eyck|2|
|Jan Van Huysum|2|
|Émile Bernard|2|
|Edward Burne-Jones|2|
|Thomas Moran|2|
|Rogier Van Der Weyden|2|
|Jean-Étienne Liotard|2|
|Adélaïde Labille-Guiard|2|
|Jean-Hippolyte Flandrin|2|
|Edmund Charles Tarbell|2|
|Albert Bierstadt|2|
|Jean-Marc Nattier|2|
|Adolph Ulrich Wertmuller|2|
|Jean Béraud|2|
|Jean Frédéric Bazille|2|
|Joachim Beuckelaer|2|
|Joaquín Sorolla|2|
|David Teniers|2|
|John Constable|2|
|John Everett Millais|2|
|John Hoppner|2|
|Cornelis Troost|2|
|Adèle Romany|2|
|John Wollaston|2|
|Joseph Ducreux|2|
|Willem Van De Velde|2|
|Juan Gris|2|
|Jules Bastien-Lepage|2|
|Jules Breton|2|
|Kasimir Malevich|2|
|Léon Augustin Lhermitte|2|
|Constantin A. Westchiloff|2|
|Lord Frederic Leighton|2|
|Lorenzo Lotto|2|
|Antoine-Jean Gros|2|
|Cima Da Conegliano|2|
|Marie-Guillemine Benoist|2|
|Martin Johnson Heade|2|
|Mary Cassatt|2|
|Alexandre Cabanel|2|
|Maurice Prendergast|2|
|Maurice Utrillo|2|
|Maximilien Luce|2|
|Nicolaes Berchem|2|
|Sir Edwin Landseer|2|
|Sir Henry Raeburn|2|
|Childe Hassam|2|
|Charles Cromwell Ingham|2|
|Paul Klee|2|
|Albert Marquet|2|
|Frans Francken|2|
|Paulus Potter|2|
|Peder Severin Kroyer|2|
|Frederick Carl Frieseke|2|
|George Inness|2|
|Frank Weston Benson|2|
|George Stubbs|2|
|Georges Braque|2|
|Georges De La Tour|2|
|Cecilia Beaux|2|
|William Adolphe Bouguereau|2|
|Carel Fabritius|2|
|Gerrit Berckheyde|2|
|Gerrit Dou|2|
|Giacomo Balla|2|
|Pierre-Henri De Valenciennes|2|
|Giovanni Battista Tiepolo|2|
|Giovanni Boldini|2|
|Guido Reni|2|
|Gustav Klimt|2|
|Caesar Van Everdingen|2|
|Sir Peter Lely|2|
|Piet Mondrian|2|
|Theo Van Doesburg|2|
|Francis Luis Mora|2|
|Hans Memling|2|
|Heinrich Campendonk|2|
|William Bradford|2|
|Hendrick Ter Brugghen|2|
|Francesco Guardi|2|
|Henri Edmond Cross|2|
|Fitz Hugh Lane|2|
|Pieter Jansz. Saenredam|2|
|Ernst Ludwig Kirchner|2|
|Ivan Aivazovskiy|2|
|Jacob Van Ruisdael|2|
|Pompeo Girolamo Batoni|2|
|Reinier Nooms|2|
|Armand Guillaumin|2|
|William Michael Harnett|2|
|Jan Miense Molenaer|2|
|Jan Porcellis|2|
|Jan Steen|2|


#### Question3: Create a table that shows the most frequently painted subject for each style of painting, how many paintings there were for the most frequently painted subject in that style, how many paintings there are in that style overall, and the percent of paintings in that style with the most frequent subject.

```SQL
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
```

**Result:**

|style_total|style|subject|style_subject_total|style_subject_percentage|
|--- |--- | --- |--- |--- |
|461|American Art|Horses|57|12.36|
|323|American Landscape|Landscape Art|285|88.24|
|108|Art Nouveau|Portraits|14|12.96|
|146|Avant-Garde|Still-Life|12|8.22|
|972|Baroque|Christianity|92|9.47|
|427|Classicism|Nude|37|8.67|
|300|Cubism|Still-Life|46|15.33|
|673|Expressionism|Nude|50|7.43|
|653|Fauvism|Flowers|74|11.33|
|3078|Impressionism|Rivers/Lakes|218|7.08|
|70|Japanese Art|Rivers/Lakes|6|8.57|
|366|Nabi|Nude|37|10.11|
|272|Naturalism|Dogs|10|3.68|
|421|Neo-Classicism|Portraits|104|24.70|
|402|Orientalism|Nude|26|6.47|
|200|Pointillism|Nude|17|8.50|
|1672|Post-Impressionism|Flowers|113|6.76|
|1181|Realism|Horses|95|8.04|
|371|Renaissance|Christianity|99|26.68|
|535|Rococo|Portraits|90|16.82|
|511|Romanticism|Horses|52|10.18|
|149|Surrealism|Abstract/Modern Art|8|5.37|
|199|Symbolism|Flowers|40|20.10|
