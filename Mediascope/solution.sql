-- Посчитайте время, которое в среднем проводят пользователи на каждом сайте в каждый день
SELECT dt, site, avg(dur)
FROM site
GROUP BY dt, site
ORDER BY dt, site;
-- Сколько в среднем в день пользователи провели времени на каждом сайте в январе 2015
SELECT dt, site, avg(dur)
FROM site
WHERE dt BETWEEN '2015-01-01' AND '2015-01-31'
GROUP BY dt, site
ORDER BY dt, site;
-- Сколько пользователей было на сайте mail.ru в январе 2015
SELECT count(resp) AS users_count
FROM (SELECT DISTINCT resp 
	  FROM site
	  WHERE dt BETWEEN '2015-01-01' AND '2015-01-31' AND site = 'mail.ru') AS jan_users;
-- Cколько пользователей с весами было на сайте mail.ru в феврале 2015. 
SELECT count(resp) 
FROM (SELECT DISTINCT resp 
	  FROM site
	  WHERE dt BETWEEN '2015-01-01' AND '2015-01-31' AND site = 'mail.ru'
	 AND EXISTS(SELECT s2.resp 
				FROM site s2
			   	JOIN weight w
			   	ON w.resp = site.resp AND w.dt = site.dt)) AS feb_w_users;
-- Посчитайте для каждого пользователя средний за этот месяц вес. 
SELECT resp, avg(weight) AS mean_weight
FROM weight
WHERE dt BETWEEN '2015-02-01' AND '2015-02-28'
GROUP BY resp
ORDER BY resp;
-- Сумму полученных весов для тех, кто был на сайте mail.ru в  феврале 2015.
SELECT sum(mean_weight)
FROM (SELECT resp, avg(weight) AS mean_weight
	  FROM weight
	  WHERE dt BETWEEN '2015-02-01' AND '2015-02-28'
	  GROUP BY resp) AS w
WHERE w.resp IN (SELECT s.resp
				 FROM site s
				 WHERE dt BETWEEN '2015-02-01' AND '2015-02-28' 
				 AND s.site = 'mail.ru');