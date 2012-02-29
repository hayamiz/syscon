
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf jpeg-6b && \
	tar xf $(shell pwd)/jpegsrc.v6b.tar.gz && \
	cd jpeg-6b && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-g -I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install && \
	make install-lib && \
	make install-headers
	$(FINISH)

