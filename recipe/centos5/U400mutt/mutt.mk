
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf mutt-* && \
	tar zxf $(shell pwd)/mutt-*.tar.gz && \
	cd mutt-* && \
	./configure --prefix=$(SYSCON_PREFIX) --with-curses=$(SYSCON_PREFIX) && \
	sed -i -e 's/chgrp mail/echo chgrp mail/g' Makefile &&\
	make -j16 && \
	make install
	$(FINISH)

