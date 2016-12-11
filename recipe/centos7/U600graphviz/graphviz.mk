include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf graphviz-*.* && \
	tar zxf $(shell pwd)/graphviz-*.*.tar.gz && \
	cd graphviz-*.*&& \
	./configure --prefix=$(SYSCON_PREFIX) --enable-perl=no --enable-python=no &&\
	make -j16 &&\
	make install
	$(FINISH)

