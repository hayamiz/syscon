include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf graphviz-*.* && \
	tar xf $(shell pwd)/parallel-*.tar.bz2 && \
	cd parallel-*&& \
	./configure --prefix=$(SYSCON_PREFIX) &&\
	make -j16 &&\
	make install
	$(FINISH)

