
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf openssl-* && \
	tar zxf $(shell pwd)/openssl-*.tar.gz && \
	cd openssl-* && \
	ln -sf $(SYSCON_PREFIX)/lib/libz.a && \
	ln -sf $(SYSCON_PREFIX)/include/zlib.h ./include/ && \
	ln -sf $(SYSCON_PREFIX)/include/zconf.h ./include/ && \
	export CFLAGS="-I$(SYSCON_PREFIX)/usr/include" && \
	export LDFLAGS="-L$(SYSCON_PREFIX)/usr/lib" && \
	./config --prefix=$(SYSCON_PREFIX) \
	         --with-zlib-include=$(SYSCON_PREFIX)/include \
	         --with-zlib-lib=$(SYSCON_PREFIX)/lib threads shared zlib && \
	make -j 8 && \
	make install
	$(FINISH)

