
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf lv* && \
	tar zxf $(shell pwd)/lv*.tar.gz && \
	cd lv* && \
	cd build && \
	LDFLAGS="-L$(SYSCON_PREFIX)/lib" ../src/configure --prefix=$(SYSCON_PREFIX) && \
	make -j16 && \
	make install
	$(FINISH)

