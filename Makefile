CC=gcc
CFLAGS=-c
LFLAGS=

.PHONY: all clean

clean:
	rm -f hash hash.o

all: hash

hash: hash.o
	$(CC) $(LFLAGS) hash.o -o hash

hash.o: hash.c
	$(CC) $(CFLAGS) hash.c
 