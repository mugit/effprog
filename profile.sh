!/bin/bash

DATE=$(date -d "today" +"%Y%m%d%H%M%S").log

perf stat -e cycles ./hash input input2 > $DATE 2>&1
