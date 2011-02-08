
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf cmake-* && \
	tar zxf $(shell pwd)/cmake-*.tar.gz && \
	cd cmake-* && \
	C_FLAGS="-I$(SYSCON_PREFIX)/include" ./bootstrap --prefix=$(SYSCON_PREFIX) --parallel=16 && \
	escaped_prefix=$$(echo $(SYSCON_PREFIX)|sed -e 's/\//\\\//g') && \
	find . -name "*.make" | xargs sed -i -e "s/-I$${escaped_prefix}\/include\/ncurses/-I$${escaped_prefix}\/include\/ncurses -I$${escaped_prefix}\/include/g" && \
	gmake && \
	make install
	$(FINISH)

