
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf git-* && \
	tar xf $(shell pwd)/git-*.tar.bz2 && \
	cd git-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	  --with-perl=`which perl` \
	  CFLAGS="-g -Wall -I$(SYSCON_PREFIX)/include" \
	  LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j8 && \
	make install
	$(FINISH)

