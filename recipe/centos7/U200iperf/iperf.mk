
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf iperf-2.0.5 && \
	tar xf $(shell pwd)/iperf-2.0.5.tar.gz && \
	cd iperf-2.0.5 && \
	./configure --prefix=$(SYSCON_PREFIX) \
	            CFLAGS="-g -I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j16 && \
	make install
	$(FINISH)

