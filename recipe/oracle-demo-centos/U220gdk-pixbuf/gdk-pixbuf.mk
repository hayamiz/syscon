
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf gdk-pixbuf-* && \
	tar xf $(shell pwd)/gdk-pixbuf-*.tar.bz2 && \
	cd gdk-pixbuf-* && \
	./configure --prefix=$(SYSCON_PREFIX) CFLAGS="-I$(SYSCON_PREFIX)/include -g" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

