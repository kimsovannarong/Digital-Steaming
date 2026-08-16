use digital_streaming;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE
);

CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    user_id INT,
    plan_type VARCHAR(20), -- Basic, Standard, Premium
    start_date DATE,
    end_date DATE,
    monthly_fee DECIMAL(6, 2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE content (
    content_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(30),
    release_year INT,
    duration_minutes INT
);

CREATE TABLE watch_history (
    watch_id INT PRIMARY KEY,
    user_id INT,
    content_id INT,
    watched_at DATETIME,
    watch_duration_minutes INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (content_id) REFERENCES content(content_id)
);