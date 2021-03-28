-- Посчитайте время, которое в среднем проводят пользователи на каждом сайте в каждый день
SELECT dt, site, avg(dur)
FROM site
GROUP BY dt, site
ORDER BY dt, site;
-- 