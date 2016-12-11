include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf gdb-*.* && \
	tar zxf $(shell pwd)/gdb-*.*.tar.gz&& \
	cd gdb-*.*&& \
	./configure --prefix=$(SYSCON_PREFIX) --with-python &&\
	make -j16 &&\
	make install
	$(FINISH)

