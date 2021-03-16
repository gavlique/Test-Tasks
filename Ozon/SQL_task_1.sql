/* Найдем самый верхний уровень для каждого товара,
дважды используя self-join */
WITH upper_cat AS (
	SELECT
	c1.id,
	CASE
		WHEN c1.parent_id IS NULL THEN c1.name
		WHEN c2.parent_id IS NULL THEN c2.name
		ELSE c3.name
	END AS item_category
	FROM category AS c1
	LEFT JOIN category c2
	ON c1.parent_id = c2.id
	LEFT JOIN category c3
	ON c2.parent_id = c3.id
)
SELECT c.item_name, u.item_category
FROM item_category AS c
JOIN upper_cat AS u
ON c.category_id = u.id;
