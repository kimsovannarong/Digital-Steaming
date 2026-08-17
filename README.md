# SQL Challenge 02: Digital Streaming Platform

## 📌 Overview
This module models a video-on-demand (VOD) entertainment service. Key focus areas include subscriber lifecycle management, streaming engagement logs, genre popularity, Monthly Active Users (MAU), and revenue tracking.

## 🗄️ Database Schema
- **`users`**: Account registration details, country, and join dates.
- **`subscriptions`**: Tier plans (`Basic`, `Standard`, `Premium`), pricing, and active status.
- **`content`**: Catalog details including titles, genres, release year, and duration.
- **`watch_history`**: Granular telemetry logging playback timestamps and duration watched.

---

## 🎯 Challenges (20 Questions)
1. **User Filtering**: Select all users registered from a specific country (e.g., 'USA').
2. **Catalog Distribution**: Count the total number of content titles available in each genre.
3. **Active Subscribers**: Find all users currently on an active 'Premium' subscription plan.
4. **Recent Releases**: List all content released after the year 2020.
5. **Session Averages**: Calculate average watch time per session across all users.
6. **Signup Window**: Retrieve all users who signed up within a specific date range.
7. **Top Content**: Find the top 3 most-watched titles based on total watch duration in minutes.
8. **Plan Popularity**: Count active subscriptions per plan type (`Basic`, `Standard`, `Premium`).
9. **User Engagement**: Calculate total duration watched per user across all playback sessions.
10. **High Completion Rate**: Find users who watched more than 80% of a specific title's total runtime in a single session.
11. **High-Performing Genres**: List genres with total accumulated watch time exceeding 200 minutes.
12. **Geographic Preference**: Find the most popular genre among users in each country based on watch duration.
13. **Subscription Lifecycle**: Identify cancelled subscriptions and calculate their active duration in days.
14. **Unwatched Content**: Identify content titles that have never been watched.
15. **Binge-Watch Identification**: Identify potential binge-watchers (users logging 2 or more watch sessions on the same date).
16. **Monthly Active Users (MAU)**: Calculate unique user engagement counts per month.
17. **Content Drop-off**: Find sessions where content was stopped early (watched for less than 25% of total runtime).
18. **Cumulative Watch Time**: Compute running total watch time per user ordered by watch timestamp.
19. **Top Titles by Genre**: Rank top 2 watched titles per genre using `DENSE_RANK()`.
20. **Monthly Recurring Revenue (MRR)**: Calculate estimated MRR grouped by subscription start month.
