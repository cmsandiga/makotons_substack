-- Enable pageinspect extension for exploring PostgreSQL internals
CREATE EXTENSION IF NOT EXISTS pageinspect;

-- Enable additional useful extensions
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
CREATE EXTENSION IF NOT EXISTS btree_gin;
CREATE EXTENSION IF NOT EXISTS btree_gist;