use digital_streaming;

-- Q1
SELECT * 
FROM users 
WHERE country = 'USA';

-- Q2
SELECT genre, COUNT(*) AS total_content
FROM content
GROUP BY genre;

-- Q3
SELECT u.user_id, u.username, s.plan_type
FROM users u
JOIN subscriptions s ON u.user_id = s.user_id
WHERE s.plan_type = 'Premium' AND s.end_date IS NULL;

-- Q4
SELECT * FROM content WHERE release_year > 2020;

-- Q5
SELECT ROUND(AVG(watch_duration_minutes), 2) AS avg_watch_time
FROM watch_history;

-- Q6
SELECT * FROM users WHERE signup_date BETWEEN '2024-01-01' AND '2024-02-28';

-- Q7
SELECT c.content_id, c.title, SUM(wh.watch_duration_minutes) AS total_minutes_watched
FROM watch_history wh
JOIN content c ON wh.content_id = c.content_id
GROUP BY c.content_id, c.title
ORDER BY total_minutes_watched DESC
LIMIT 3;

-- Q8
SELECT plan_type, COUNT(*) AS active_subscriptions
FROM subscriptions
WHERE end_date IS NULL
GROUP BY plan_type;

-- Q9
SELECT u.user_id, u.username, COALESCE(SUM(wh.watch_duration_minutes), 0) AS total_watch_time
FROM users u
LEFT JOIN watch_history wh ON u.user_id = wh.user_id
GROUP BY u.user_id, u.username;

-- Q10
SELECT DISTINCT u.user_id, u.username, c.title, wh.watch_duration_minutes, c.duration_minutes
FROM watch_history wh
JOIN content c ON wh.content_id = c.content_id
JOIN users u ON wh.user_id = u.user_id
WHERE (wh.watch_duration_minutes / c.duration_minutes) >= 0.80;

-- Q11
SELECT c.genre, SUM(wh.watch_duration_minutes) AS total_genre_watch_time
FROM watch_history wh
JOIN content c ON wh.content_id = c.content_id
GROUP BY c.genre
HAVING total_genre_watch_time > 200;

-- Q12
WITH CountryGenreWatch AS ( 
    SELECT 
        u.country, 
        c.genre, 
        SUM(wh.watch_duration_minutes) AS total_watch_time, 
        ROW_NUMBER() OVER (PARTITION BY u.country ORDER BY SUM(wh.watch_duration_minutes) DESC) AS rnk 
    FROM watch_history wh 
    JOIN users u ON wh.user_id = u.user_id 
    JOIN content c ON wh.content_id = c.content_id 
    GROUP BY u.country, c.genre 
) 
SELECT country, genre, total_watch_time 
FROM CountryGenreWatch 
WHERE rnk = 1;

-- Q13
SELECT 
    subscription_id, 
    user_id, 
    plan_type, 
    DATEDIFF(end_date, start_date) AS active_days 
FROM subscriptions 
WHERE end_date IS NOT NULL;

-- Q14
SELECT c.*
FROM content c
LEFT JOIN watch_history wh ON c.content_id = wh.content_id
WHERE wh.watch_id IS NULL;

-- Q15
SELECT user_id, DATE(watched_at) AS watch_date, COUNT(*) AS session_count, SUM(watch_duration_minutes) AS total_daily_minutes
FROM watch_history
GROUP BY user_id, DATE(watched_at)
HAVING COUNT(*) >= 2;

-- Q16
SELECT 
    DATE_FORMAT(watched_at, '%Y-%m') AS activity_month,
    COUNT(DISTINCT user_id) AS active_users
FROM watch_history
GROUP BY DATE_FORMAT(watched_at, '%Y-%m')
ORDER BY activity_month;

-- Q17
SELECT 
    wh.watch_id, 
    u.username, 
    c.title, 
    wh.watch_duration_minutes, 
    c.duration_minutes,
    ROUND((wh.watch_duration_minutes / c.duration_minutes) * 100, 2) AS watch_percentage
FROM watch_history wh
JOIN content c ON wh.content_id = c.content_id
JOIN users u ON wh.user_id = u.user_id
WHERE (wh.watch_duration_minutes / c.duration_minutes) < 0.25;

-- Q18
SELECT 
    watch_id, 
    user_id, 
    watched_at, 
    watch_duration_minutes,
    SUM(watch_duration_minutes) OVER (PARTITION BY user_id ORDER BY watched_at) AS running_user_watch_time
FROM watch_history;

-- Q19
WITH TitleRanks AS (
    SELECT c.genre, c.title, SUM(wh.watch_duration_minutes) AS total_watch_time,
           DENSE_RANK() OVER (PARTITION BY c.genre ORDER BY SUM(wh.watch_duration_minutes) DESC) AS rank_in_genre
    FROM watch_history wh
    JOIN content c ON wh.content_id = c.content_id
    GROUP BY c.genre, c.title
)
SELECT genre, title, total_watch_time, rank_in_genre
FROM TitleRanks
WHERE rank_in_genre <= 2;

-- Q20
SELECT DATE_FORMAT(s.start_date, '%Y-%m') AS revenue_month,
       SUM(s.monthly_fee) AS estimated_mrr
FROM subscriptions s
GROUP BY DATE_FORMAT(s.start_date, '%Y-%m')
ORDER BY revenue_month;