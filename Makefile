CC=gcc
LFLAGSPROF=-O -pg -lm
FLAGSCOV=-O --coverage -lm
LFLAGS=-O3 -lm
DATE1=$$(date -d "today" +"gprof_%Y%m%d%H%M").log
DATE2=$$(date -d "today" +"gcov_%Y%m%d%H%M").log

.PHONY: all clean


all: hash

hash: hash.c
	$(CC) $(LFLAGS) hash.c -o hash

a.1.out: hash.c
	$(CC) $(LFLAGSPROF) hash.c
	mv a.out a.1.out

a.2.out: hash.c
	$(CC) $(FLAGSCOV) hash.c
	mv hash.gcno a.gcno
	mv a.out a.2.out	

gprof: a.1.out
	./a.1.out input input2 > /dev/null 2>&1
	gprof a.1.out > $(DATE1) 2>&1

coverage: a.2.out
	./a.2.out input input2 > /dev/null 2>&1
	mv hash.gcda a.gcda
	gcov a.out > $(DATE2) 2>&1
	
clean:
	rm -f hash hash.o a.out a.1.out a.2.out a.gcno a.gcda gmon.out *.gcov
