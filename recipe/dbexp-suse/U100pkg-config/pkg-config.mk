
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf pkg-config-* && \
	tar zxf $(shell pwd)/pkg-config-*.tar.gz && \
	cd pkg-config-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j16 && \
	make install
	$(FINISH)

