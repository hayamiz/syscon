include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf htop-*.* && \
	tar zxf $(shell pwd)/htop-*.*.tar.gz&& \
	cd htop-*.*&& \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j16 && \
	make install
	$(FINISH)

