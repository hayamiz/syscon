
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf libtool-* && \
	tar zxf $(shell pwd)/libtool-*.tar.gz && \
	cd libtool-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j16 && \
	make install
	$(FINISH)

