# usage:
# make -f FreeBSD.make && sudo make -f FreeBSD.make install

.PHONY: clean install

GMAKE=gmake -C $(.CURDIR)

darknet:
	$(GMAKE) CC=cc CFLAGS='-I/usr/local/include -fPIC' LDFLAGS='-L/usr/local/lib -lnnpack -lpthreadpool -lm -static -pthread' ARM_NEON=0

install: darknet
	install -s $(.CURDIR)/darknet /usr/local/bin

clean:
	$(GMAKE) clean
