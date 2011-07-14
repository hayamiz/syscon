
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf ncurses-* && \
	tar zxf $(shell pwd)/ncurses-*.tar.gz && \
	cd ncurses-* && \
	./configure --prefix=$(SYSCON_PREFIX) --with-shared && \
	make -j 8 && \
	make install
	$(FINISH)

