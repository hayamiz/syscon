
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf expat-2.0.1 && \
	tar zxf $(shell pwd)/expat-*.tar.gz && \
	cd expat-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)
