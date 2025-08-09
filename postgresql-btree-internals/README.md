# PostgreSQL PageInspect Demo Setup

Setup to explore PostgreSQL internals and real B-trees for Part 3 article.
Based on the exact examples from Part 2 with maria@example.com and identical data structure.

## Requirements

- **Docker Compose**: v2.0+ (use `docker compose` not `docker-compose`)
- **Docker**: 20.10+ 
- **OS**: Ubuntu 18.04+ (or compatible Linux distribution)
- **Architecture**: x86_64/amd64

## Quick Start

```bash
# Build and start the container
docker-compose up -d

# Connect to PostgreSQL
docker exec -it postgres_pageinspect_demo psql -U makotons -d makotons_substack
```

## Demo Options

### Option 1: Complete Demo (Blog Post Style)
```sql
-- Run all queries as shown in the blog post
\i demo_queries.sql
```

### Option 2: Step-by-Step Tutorial
Execute these files one by one for detailed exploration:

```sql
-- 0. Basic query - Maria's record
\i tutorial/00_basic_query.sql

-- 1. File system exploration
\i tutorial/01_file_system.sql

-- 2. B-tree internals with pageinspect
\i tutorial/02_btree_internals.sql

-- 3. Complete journey
\i tutorial/03_complete_journey.sql

-- 4. Buffer management
\i tutorial/04_buffer_managment.sql
```

```bash
# Physical file system exploration (run outside PostgreSQL)
./tutorial/02_physical_files.sh

# Binary data deep dive
./tutorial/05_binary_data_deep_dive.sh
```


## Cleanup

```bash
# Stop and clean up
docker compose down -v
```