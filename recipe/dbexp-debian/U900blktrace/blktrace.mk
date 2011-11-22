
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf blktrace-* && \
	tar xf $(shell pwd)/blktrace-*.tar.gz && \
	cd blktrace* && \
	sed -i -e 's/^prefix = \/usr\/local/prefix = /g' Makefile && \
	DESTDIR=$(SYSCON_PREFIX) make install
	$(FINISH)
