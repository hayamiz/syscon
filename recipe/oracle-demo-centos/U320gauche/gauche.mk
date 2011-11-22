
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf Gauche-* && \
	tar xf $(shell pwd)/Gauche-*.tgz && \
	cd Gauche-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	  --enable-multibyte=utf-8 \
	  --enable-threads=pthreads \
	  --enable-ipv6 \
	  CFLAGS="-g -Wall -I$(SYSCON_PREFIX)/include" \
	  LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j8 && \
	make install
	$(FINISH)

