/* Обозначим таблицу, содержащую начала периодов, как S, 
а таблицу, содержащую концы периодов, как E */ 
WITH s AS (
	SELECT user_id,
	CASE
		WHEN balance > 0 AND ((LAG(balance) OVER(PARTITION BY user_id ORDER BY date) IS NULL)
			OR ((LAG(balance) OVER(PARTITION BY user_id ORDER BY date) = 0)))
		THEN date
	END start_date
	FROM the_table
	WHERE date BETWEEN '2019-05-01' AND '2019-05-10'),
e AS (
	SELECT user_id,
	CASE
		WHEN balance > 0 AND ((LEAD(balance) OVER(PARTITION BY user_id ORDER BY date) IS NULL)
			OR ((LEAD(balance) OVER(PARTITION BY user_id ORDER BY date) = 0)))
		THEN date
	END end_date
	FROM the_table
	WHERE date BETWEEN '2019-05-01' AND '2019-05-10')
SELECT s.user_id, start_date, end_date, 
	end_date - start_date + 1  AS length,
	(SELECT avg(balance)::integer FROM the_table 
	 	WHERE date BETWEEN start_date AND end_date AND user_id = s.user_id) AS balance_avg
FROM s
JOIN e	
/* Теперь осталось только очистить таблицу от NULL и аккуратно задать условия 
соединения, чтобы начальная дата присоединялась только к соответствующей конечной */
ON e.user_id = s.user_id 
	AND	end_date = (SELECT min(e1.end_date) 
					FROM e AS e1 
					WHERE start_date <= e1.end_date AND e1.user_id = s.user_id) 




