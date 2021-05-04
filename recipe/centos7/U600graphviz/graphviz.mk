include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf graphviz-*.* && \
	rm -rf gts-* && \
	tar zxf $(shell pwd)/gts-0.7.6.tar.gz && \
	cd gts-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j16 && make install && \
	cd ../ && \
	tar zxf $(shell pwd)/graphviz-*.*.tar.gz && \
	cd graphviz-*.*&& \
	./configure --prefix=$(SYSCON_PREFIX) --enable-perl=no --enable-python=no --with-gts=yes --with-rsvg=yes --with-ghostscript=yes --with-pangocairo=yes --with-poppler=yes --with-gd=yes --with-lasi &&\
	make -j16 &&\
	make install
	$(FINISH)

