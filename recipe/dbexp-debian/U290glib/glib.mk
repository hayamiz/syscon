
include $(SYSCON_INCLUDE)/common.mk

OPTIONS = --enable-gc-friendly --disable-mem-pools --enable-threads CFLAGS='-g -O2'
$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf glib-* && \
	tar zxf $(shell pwd)/glib-*.tar.gz && \
	cd glib-* && \
	./configure --prefix=$(SYSCON_PREFIX) $(OPTIONS) && \
	make -j16 && \
	make install
	$(FINISH)

