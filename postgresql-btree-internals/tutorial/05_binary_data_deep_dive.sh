#!/bin/bash
# 05_binary_data_deep_dive.sh
# Binary Data Deep Dive

echo "=========================================="
echo "05. BINARY DATA DEEP DIVE"
echo "=========================================="
echo

echo "1. Examine the index file structure:"
echo "   (This will open in 'less' - use 'q' to quit, space/arrows to navigate)"
read -p "Press Enter to continue..."
docker exec postgres_pageinspect_demo bash -c "pg_filedump -f /var/lib/postgresql/data/base/16384/17554" | less
echo
read -p "Press Enter to continue to final step..."
echo

echo "2. Look at the heap table data where Maria's record lives:"
echo "   (This will open in 'less' - use 'q' to quit, space/arrows to navigate)"
read -p "Press Enter to continue..."
docker exec postgres_pageinspect_demo bash -c "pg_filedump -R 0 /var/lib/postgresql/data/base/16384/17547" | less