
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_PREFIX) && \
	rm -rf automake-* &&\
	tar zxf $(shell pwd)/automake-*.tar.gz && \
	cd automake-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j16 && \
	make install
	$(FINISH)

