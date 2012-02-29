
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf global-* && \
	tar zxf $(shell pwd)/global-*.tar.gz && \
	cd global-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j8 && \
	make install
	$(FINISH)

