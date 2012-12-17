CC=gcc
CFLAGS=-c
LFLAGS=-O3 -pg -lm
DATE=$$(date -d "today" +"gprof_%Y%m%d%H%M").log

.PHONY: all clean


all: hash

hash: hash.o
	$(CC) $(LFLAGS) hash.o
	cp a.out hash

hash.o: hash.c
	$(CC) $(CFLAGS) hash.c

gprof: a.out
	./a.out input input2 > /dev/null 2>&1
	gprof a.out > $(DATE) 2>&1

clean:
	rm -f hash hash.o a.out gmon.out
