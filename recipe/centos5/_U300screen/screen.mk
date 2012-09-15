
include $(SYSCON_INCLUDE)/common.mk

patches := $(shell find $(shell pwd) -name "*.patch")

$(SYSCON_TARGET):
	echo $(patches)
	cd $(SYSCON_BUILDDIR) && \
	rm -rf screen-* &&\
	tar xf $(shell pwd)/screen-*.tar.gz && \
	cd screen-* && \
	for patchfile in $(patches); do \
	  patch -p1 < $$patchfile; \
	done && \
	./configure --prefix=$(SYSCON_PREFIX) --enable-color256 \
	  CFLAGS="-g -O2 -I$(SYSCON_PREFIX)/include" \
	  LDFLAGS="-L$(SYSCON_PREFIX)/lib" && \
	make -j8 && \
	make install
	$(FINISH)

