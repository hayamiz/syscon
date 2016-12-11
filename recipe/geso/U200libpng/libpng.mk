
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf libpng-1.5.6 && \
	tar xf $(shell pwd)/libpng-1.5.6.tar.gz && \
	cd libpng-1.5.6 && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-g -I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

