-- 00_basic_query.sql
-- Basic Query Analysis - Maria's Record and Database Structure

-- The main query from the article - find Maria's record
SELECT * FROM users WHERE email = 'maria@example.com';

-- Analyze the query execution with buffer statistics
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM users WHERE email = 'maria@example.com';