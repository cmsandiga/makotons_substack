#!/bin/bash
# 02_physical_files.sh
# Physical File System Exploration

echo "=========================================="
echo "02. PHYSICAL FILE SYSTEM EXPLORATION"
echo "=========================================="
echo

echo "1. Navigate to database files and list them:"
docker exec postgres_pageinspect_demo bash -c "cd /var/lib/postgresql/data/base/16384/ && ls -lh 17547 17554"
echo
read -p "Press Enter to continue to next step..."
echo

echo "2. Raw binary content (index file):"
docker exec postgres_pageinspect_demo bash -c "cd /var/lib/postgresql/data/base/16384/ && hexdump -C 17554 | head -5"
echo
read -p "Press Enter to continue to next step..."
echo
