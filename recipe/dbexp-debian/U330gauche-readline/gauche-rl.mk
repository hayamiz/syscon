
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf Gauche-readline-* && \
	tar xf $(shell pwd)/Gauche-readline-*.tar.gz && \
	cd Gauche-readline-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	  CFLAGS="-I$(SYSCON_PREFIX)/include" \
	  LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j8 && \
	make install
	$(FINISH)

