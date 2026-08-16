use digital_streaming;

-- Insert Users
INSERT INTO users (user_id, username, country, signup_date) VALUES
(1, 'alex_m', 'USA', '2024-01-10'),
(2, 'sarah_k', 'Canada', '2024-01-15'),
(3, 'david_p', 'UK', '2023-11-20'),
(4, 'lisa_t', 'USA', '2024-02-01'),
(5, 'carlos_r', 'Mexico', '2023-08-12'),
(6, 'emily_w', 'USA', '2024-03-05');

-- Insert Subscriptions
INSERT INTO subscriptions (subscription_id, user_id, plan_type, start_date, end_date, monthly_fee) VALUES
(101, 1, 'Premium', '2024-01-10', NULL, 15.99),
(102, 2, 'Standard', '2024-01-15', NULL, 11.99),
(103, 3, 'Basic', '2023-11-20', '2024-01-20', 8.99),
(104, 4, 'Premium', '2024-02-01', NULL, 15.99),
(105, 5, 'Standard', '2023-08-12', '2024-02-12', 11.99),
(106, 6, 'Basic', '2024-03-05', NULL, 8.99);

-- Insert Content
INSERT INTO content (content_id, title, genre, release_year, duration_minutes) VALUES
(201, 'Cyber Nexus', 'Sci-Fi', 2022, 120),
(202, 'Shadow Legacy', 'Action', 2021, 145),
(203, 'Laugh Out Loud', 'Comedy', 2023, 90),
(204, 'Deep Blue Ocean', 'Documentary', 2019, 60),
(205, 'The Lost Kingdom', 'Action', 2024, 135),
(206, 'Midnight Mystery', 'Thriller', 2020, 110);

-- Insert Watch History
INSERT INTO watch_history (watch_id, user_id, content_id, watched_at, watch_duration_minutes) VALUES
(1, 1, 201, '2024-03-01 14:30:00', 120),
(2, 1, 202, '2024-03-02 20:00:00', 140),
(3, 2, 203, '2024-03-01 18:15:00', 90),
(4, 3, 201, '2024-01-05 10:00:00', 45),
(5, 4, 205, '2024-03-03 21:00:00', 135),
(6, 1, 205, '2024-03-04 19:30:00', 130),
(7, 5, 202, '2024-01-15 15:00:00', 20),
(8, 2, 206, '2024-03-05 22:10:00', 105),
(9, 4, 201, '2024-03-06 16:45:00', 115),
(10, 6, 203, '2024-03-07 11:20:00', 85);