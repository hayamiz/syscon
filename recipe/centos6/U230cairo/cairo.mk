
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf cairo-1.10.2.tar.gz && \
	tar zxf $(shell pwd)/cairo-1.10.2.tar.gz && \
	cd cairo-1.10.2 && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j8 && \
	make install
	$(FINISH)

