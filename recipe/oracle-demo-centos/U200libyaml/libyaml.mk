
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf yaml-* && \
	tar zxf $(shell pwd)/yaml-*.tar.gz && \
	cd yaml-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

