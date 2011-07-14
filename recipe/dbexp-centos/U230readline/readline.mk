
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf readline-* && \
	tar zxf $(shell pwd)/readline-*.tar.gz && \
	cd readline-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j8 && \
	make install
	$(FINISH)

