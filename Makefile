PREFIX="/usr"
DESTDIR="/"

NPM="npm"

all: sans mono

sans:
	$(MAKE) -C $@

mono:
	$(MAKE) -C $@ NPM=$(NPM)

install:
	$(MAKE) -C sans install PREFIX=$(PREFIX) DESTDIR=$(DESTDIR)
	$(MAKE) -C mono install PREFIX=$(PREFIX) DESTDIR=$(DESTDIR)

clean:
	$(MAKE) -C sans clean
	$(MAKE) -C mono clean

.PHONY: sans mono
