
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf jansson-* && \
	tar xf $(shell pwd)/jansson-*.tar.gz && \
	cd jansson-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	  CFLAGS="-g -Wall -I$(SYSCON_PREFIX)/include" \
	  LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j8 && \
	make install
	$(FINISH)

