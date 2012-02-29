
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf libxslt-* && \
	tar zxf $(shell pwd)/libxslt-*.tar.gz && \
	cd libxslt-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

