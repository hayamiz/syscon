
include $(SYSCON_INCLUDE)/common.mk

OPTIONS = --enable-gc-friendly --disable-mem-pools --enable-threads --disable-gtk-doc --disable-gtk-doc-html --disable-gtk-doc-pdf --with-python=$(SYSCON_PREFIX)/bin/python CFLAGS='-g -O2 -I$(SYSCON_PREFIX)/include' LDFLAGS='-L$(SYSCON_PREFIX)/lib -L$(SYSCON_PREFIX)/lib64'

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf glib-* && \
	tar zxf $(shell pwd)/glib-*.tar.gz && \
	cd glib-* && \
	./configure --prefix=$(SYSCON_PREFIX) $(OPTIONS) && \
	make -j16 && \
	make install
	$(FINISH)

