
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf R-* && \
	tar zxf $(shell pwd)/R-*.tar.gz && \
	cd R-* && \
	./configure --prefix=$(SYSCON_PREFIX) --without-x \
	            CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

