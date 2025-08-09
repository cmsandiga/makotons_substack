-- 01_file_system.sql
-- File System Exploration

-- The main query - find Maria's record
SELECT * FROM users WHERE email = 'maria@example.com';

-- Analyze execution with buffer statistics
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM users WHERE email = 'maria@example.com';

-- Find our database OID
SELECT oid as db_oid, datname
FROM pg_database
WHERE datname = 'makotons_substack';

-- Find table and index file locations
SELECT oid, relname, relkind, relfilenode, pg_relation_filepath(oid)
FROM pg_class
WHERE relname IN ('users', 'idx_users_email');
