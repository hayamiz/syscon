
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf autoconf-* &&\
	tar xf $(shell pwd)/autoconf-*.tar.gz && \
	cd autoconf-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j8 && \
	make install
	$(FINISH)

