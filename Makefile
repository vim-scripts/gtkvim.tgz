
CC       = gcc
EXES     = rangewidgets gtkvim.tgz

# GTK 1
##GTKFLAGS = `gtk-config --cflags` -I.
##GTKLIBS  = `gtk-config --libs`

# GTK 2
GTKFLAGS = `pkg-config gtk+-2.0 --cflags` -I.
GTKLIBS  = `pkg-config gtk+-2.0 --libs`

all: $(EXES)

rangewidgets: rangewidgets.o gtkvim.o 
	$(CC) -g rangewidgets.o gtkvim.o -o rangewidgets $(GTKLIBS)
	#$(CC) -g rangewidgets.o gtkvim.o -o rangewidgets gtk/*.o xdgmime/*.o gdk/*.o x11/*.o $(GTKLIBS)

rangewidgets.o: rangewidgets.c gtkvim.h
	$(CC) -Wall -g $(GTKFLAGS) -c rangewidgets.c

gtkvim.o: gtkvim.c gtkvim.h
	$(CC) -Wall -g $(GTKFLAGS) -c gtkvim.c

clean: 
	rm -f *.o $(EXES)

gtkvim.tgz: Makefile gtkvim.c gtkvim.h rangewidgets.c
	cd ..;  \
	tar zcvf gtkvim/gtkvim.tgz  \
	  gtkvim/Makefile gtkvim/gtkvim.c gtkvim/gtkvim.h gtkvim/rangewidgets.c
