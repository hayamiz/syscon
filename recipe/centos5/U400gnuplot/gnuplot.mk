
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf gnuplot-* && \
	tar zxf $(shell pwd)/gnuplot-*.tar.gz && \
	cd gnuplot-* && \
	./configure --prefix=$(SYSCON_PREFIX) --without-lisp-files --without-list-files --without-x && \
	make -j16 && \
	make install
	$(FINISH)

