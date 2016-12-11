
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf the_silver_searcher-* && \
	tar zxf $(shell pwd)/the_silver_searcher-*.tar.gz && \
	cd the_silver_searcher-* && \
	export CFLAGS="-I$(SYSCON_PREFIX)/include" && \
       	export LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	./build.sh --prefix=$(SYSCON_PREFIX) && \
	make install
	$(FINISH)

