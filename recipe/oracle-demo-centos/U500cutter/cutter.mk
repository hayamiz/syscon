
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf cutter-1.1.3.tar.gz && \
	tar zxf $(shell pwd)/cutter-1.1.3.tar.gz && \
	cd cutter-1.1.3 && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            --enable-pthread --disable-install-doc \
	            CFLAGS="-g -I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

