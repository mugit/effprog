DATE=$(date -d "today" +"%Y%m%d%H%M").log

perf stat -e cycles,cache-misses,instructions ./hash input input2 > $DATE 2>&1
