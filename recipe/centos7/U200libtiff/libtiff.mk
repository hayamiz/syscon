
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf tiff-* && \
	tar xf $(shell pwd)/tiff-*.tar.gz && \
	cd tiff-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-g -I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

