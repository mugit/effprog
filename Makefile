CC=gcc
CFLAGS=-c -O3
LFLAGS=-lm

.PHONY: all clean

all: hash

hash: hash.o
	$(CC) $(LFLAGS) hash.o -o hash

hash.o: hash.c
	$(CC) $(CFLAGS) hash.c
 
clean:
	rm -f hash hash.o
