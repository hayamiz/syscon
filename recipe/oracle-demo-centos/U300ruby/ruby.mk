
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf ruby-* && \
	tar zxf $(shell pwd)/ruby-*.tar.gz && \
	cd ruby-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            --enable-pthread --disable-install-doc \
	            CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

