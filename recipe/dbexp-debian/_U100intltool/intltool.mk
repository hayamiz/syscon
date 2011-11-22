
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf intltool-* &&\
	tar xf $(shell pwd)/intltool-*.tar.bz2 && \
	cd intltool-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make && \
	make install
	$(FINISH)

