
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf libxml2-* && \
	tar zxf $(shell pwd)/libxml2-*.tar.gz && \
	cd libxml2-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)
