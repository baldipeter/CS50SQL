SELECT strftime('%Y', air_date) AS 'year',
(strftime('%m', air_date) || '-' || strftime('%d', air_date)) AS 'month-day'
FROM episodes
GROUP BY strftime('%Y', air_date);
