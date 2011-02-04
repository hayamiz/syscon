
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf perl-* &&\
	tar xf $(shell pwd)/perl-*.tar.gz && \
	cd perl-* && \
	sh Configure -de -Dprefix=$(SYSCON_PREFIX) \
	  -Accflags="-g -I$(SYSCON_PREFIX)/include" \
	  -Aldflags="-L$(SYSCON_PREFIX)/lib" && \
	make -j8 && \
	make test && \
	make install
	$(FINISH)

