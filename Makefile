override CFLAGS=-Wall -O3

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)

GTK2_CFLAGS:=`pkg-config --cflags gtk+-2.0`
GTK2_LDFLAGS:=`pkg-config --libs gtk+-2.0`

all: gmsgbox

%.o: %.c
	$(CC) $(CFLAGS) $(GTK2_CFLAGS) -c -o $@ $<

gmsgbox: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS) $(GTK2_LDFLAGS)

clean:
	rm -f *.o gmsgbox
