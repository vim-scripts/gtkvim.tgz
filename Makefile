
CC       = gcc
EXES     = rangewidgets gtkvim.tgz
GTKFLAGS = `gtk-config --cflags` -I.
GTKLIBS  = `gtk-config --libs`

all: $(EXES)

rangewidgets: rangewidgets.o gtkvim.o
	$(CC) rangewidgets.o gtkvim.o -o rangewidgets $(GTKLIBS)

rangewidgets.o: rangewidgets.c gtkvim.h
	$(CC) -g $(GTKFLAGS) -c rangewidgets.c

gtkvim.o: gtkvim.c gtkvim.h
	$(CC) -g $(GTKFLAGS) -c gtkvim.c

clean: 
	rm -f *.o $(EXES)

gtkvim.tgz: Makefile gtkvim.c gtkvim.h rangewidgets.c
	cd ..;  \
	tar zcvf gtkvim/gtkvim.tgz  \
	  gtkvim/Makefile gtkvim/gtkvim.c gtkvim/gtkvim.h gtkvim/rangewidgets.c
