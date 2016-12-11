
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf ruby-* && \
	tar xf $(shell pwd)/ruby-*.tar.bz2 && \
	cd ruby-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            --enable-pthread --disable-install-doc \
	            CFLAGS="-O3 -I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

