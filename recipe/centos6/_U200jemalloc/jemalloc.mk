
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf jemalloc-* && \
	tar zxf $(shell pwd)/jmalloc-*.tar.gz && \
	cd zlib-* && \
	CFLAGS=./configure --prefix=$(SYSCON_PREFIX) && \
	make install
	$(FINISH)

