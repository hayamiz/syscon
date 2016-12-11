
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_PREFIX) && \
	rm -rf autoconf-* &&\
	tar xf $(shell pwd)/autoconf-*.tar.gz && \
	cd autoconf-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j8 && \
	make install
	$(FINISH)

