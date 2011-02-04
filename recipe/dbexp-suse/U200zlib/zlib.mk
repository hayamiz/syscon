
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf zlib-* && \
	tar zxf $(shell pwd)/zlib-*.tar.gz && \
	cd zlib-* && \
	CFLAGS="-fPIC" ./configure --prefix=$(SYSCON_PREFIX) && \
	make install
	$(FINISH)

