/* 1. Предполагаем, что в обоих таблицах могут не только содержаться одинаковые строки,
но и разные упаковки одного и того же заказа могут также находиться в разных таблицах,
поэтому метод INTERSECT может показать нам не все.
Если же заказы не пересекаются по условиям выше, то следующий запрос должен быть пустым*/
SELECT * FROM table1
WHERE EXISTS(SELECT ordernumber.table2
			 FROM table2
			 WHERE ordernumber.table2 = ordernumber.table1);
/* 2. Воспользуемся оконными функциями*/
SELECT ordernumber,
	LAST_VALUE(packagename) OVER(PARTITION BY ordernumber ORDER BY moment
                          ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                          ) AS chosenpackage
FROM (SELECT * FROM table1
	 UNION
	 SELECT * FROM table2)
GROUP BY ordernumber, packagename, moment
