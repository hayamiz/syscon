
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	ls $(SYSCON_PREFIX)/include/net || mkdir $(SYSCON_PREFIX)/include/net
	ls /usr/include/net/bpf.h || ls $(SYSCON_PREFIX)/include/net/bpf.h || (ls /usr/include/pcap-bpf.h && ln -s /usr/include/pcap-bpf.h $(SYSCON_PREFIX)/include/net/bpf.h)
	cd $(SYSCON_BUILDDIR) && \
	rm -rf hping3-* && \
	tar zxf $(shell pwd)/hping3-20051105.tar.gz && \
	cd hping3-* && \
	./configure --prefix=$(SYSCON_PREFIX) CFLAGS="-I$(SYSCON_PREFIX)/include" LDFLAGS="-L$(SYSCON_PREFIX)/lib"  && \
	sed -i -e 's!^CCOPT= !CCOPT= -I$(SYSCON_PREFIX)/include !' Makefile && \
	sed -i -e 's!__i386__!__x86_64__!' bytesex.h && \
	make -j 8 && \
	cp hping3 $(SYSCON_PREFIX)/bin/
	$(FINISH)

