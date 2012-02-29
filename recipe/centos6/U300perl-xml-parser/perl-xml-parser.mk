
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf XML-Parser-* && \
	tar zxf $(shell pwd)/XML-Parser-2.41.tar.gz && \
	cd XML-Parser-2.41 && \
	perl Makefile.PL && \
	(make; make) && \
	make install
	$(FINISH)

