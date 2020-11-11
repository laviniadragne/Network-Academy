CC=gcc
CFLAGS=-g -Wall -Wextra -Wpedantic -m32
PUBL=publications

.PHONY: build clean

build: $(PUBL)_unlinked.o Hashtable_unlinked.o Queue_unlinked.o LinkedList_unlinked.o 
	ld -m elf_i386 -r $(PUBL)_unlinked.o Hashtable_unlinked.o Queue_unlinked.o LinkedList_unlinked.o -o $(PUBL).o

$(PUBL)_unlinked.o: $(PUBL).c $(PUBL).h
	$(CC) $(CFLAGS) $(PUBL).c -c -o $(PUBL)_unlinked.o

Hashtable_unlinked.o: Hashtable.h Hashtable.c
	$(CC) $(CFLAGS) Hashtable.c -c -o Hashtable_unlinked.o

LinkedList_unlinked.o: LinkedList.h LinkedList.c
	$(CC) $(CFLAGS) LinkedList.c -c -o LinkedList_unlinked.o

Queue_unlinked.o: Queue.h Queue.c
	$(CC) $(CFLAGS) Queue.c -c -o Queue_unlinked.o

clean:
	rm -f *.o *.h.gch
