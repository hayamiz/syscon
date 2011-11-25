
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf freetype-* && \
	tar zxf $(shell pwd)/freetype-*.tar.gz && \
	cd freetype-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

