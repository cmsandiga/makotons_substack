-- PostgreSQL B-Tree Internals Demo Queries
-- Based on "Database Index: Part 3 - Under the Hood - PostgreSQL's B-Tree in Action"
-- Clean version with only executable commands (no hardcoded page numbers)

-- Enable expanded display for better readability
\x auto;
-- \x on -- to turn on expanded display

--===============================
-- 0. BASIC QUERY AND ANALYSIS
--===============================

-- The main query from the article - find Maria's record
SELECT * FROM users WHERE email = 'maria@example.com';

-- Analyze the query execution with buffer statistics
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM users WHERE email = 'maria@example.com';

--===============================
-- 1. The File System Reality
--===============================

-- Find our database
SELECT oid as db_oid, datname
FROM pg_database
WHERE datname = 'makotons_substack';

-- Find our tables and indexes within that database
SELECT oid, relname, relkind, relfilenode, pg_relation_filepath(oid)
FROM pg_class
WHERE relname IN ('users', 'idx_users_email');

--==========================================
-- 2. Opening the Black Box with pageinspect
--==========================================

-- Load index metadata to find root page
SELECT * FROM bt_metap('idx_users_email');

-- Get the root page number from metapage and inspect it
SELECT * FROM bt_page_stats('idx_users_email', 3);

-- Scanning the leaf page for 'maria@example.com'"
SELECT
      itemoffset,
      ctid,
      itemlen,
      encode(decode(substring(data from 3), 'hex'), 'escape') as email_readable
  FROM bt_page_items('idx_users_email', 1)
  WHERE encode(decode(substring(data from 3), 'hex'), 'escape') LIKE '%maria%';

-- Understanding the ctid 

SELECT ctid, * FROM users WHERE ctid = '(0,2)';

-- run 02_physical_files.sh outside the container to explore the file system

--=========================================
-- 3. Complete Journey
-- 4. Buffer Management - The Production Reality
--==========================================
SELECT 'Hello makotons_substack' as greeting;

--=========================================
-- 5. Binary Data Deep Dive
--==========================================