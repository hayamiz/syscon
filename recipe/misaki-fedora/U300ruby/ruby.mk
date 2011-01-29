
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf ruby-1.9.1-p* && \
	tar zxf $(shell pwd)/ruby-1.9.1-p*.tar.gz && \
	cd ruby-1.9.1-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            --enable-pthread --disable-install-doc \
	            CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make && \
	make install
	$(FINISH)

