
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf git-* && \
	tar xf $(shell pwd)/git-*.tar.gz && \
	cd git-* && \
	./configure --prefix=$(SYSCON_PREFIX) \
	  --with-perl=`which perl` \
	  --with-curl --with-expat \
	  CFLAGS="-g -Wall -I$(SYSCON_PREFIX)/include" \
	  LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j8 && \
	make install
	$(FINISH)

