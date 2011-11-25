
include $(SYSCON_INCLUDE)/common.mk

OPTIONS = --enable-gc-friendly --disable-mem-pools --enable-threads CFLAGS='-g -O0'
$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf glib-* && \
	tar zxf $(shell pwd)/glib-*.tar.gz && \
	cd glib-* && \
	./configure --prefix=$(SYSCON_PREFIX) $(OPTIONS) && \
	make -j16 && \
	make install
	$(FINISH)

