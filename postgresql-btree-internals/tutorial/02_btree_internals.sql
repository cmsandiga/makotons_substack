-- 02_btree_internals.sql
-- B-tree Internals with pageinspect Extension

-- Enable expanded display
\x auto

-- Load index metadata to find root page
SELECT * FROM bt_metap('idx_users_email');

-- Inspect root page statistics
SELECT * FROM bt_page_stats('idx_users_email', 3);

-- Find Maria's record in the B-tree leaf page
SELECT
    itemoffset,
    ctid,
    itemlen,
    encode(decode(substring(data from 3), 'hex'), 'escape') as email_readable
FROM bt_page_items('idx_users_email', 1)
WHERE encode(decode(substring(data from 3), 'hex'), 'escape') LIKE '%maria%';

-- Follow the ctid to Maria's full record
SELECT ctid, * FROM users WHERE ctid = '(0,2)';

-- run 02_physical_files.sh to explore the file system