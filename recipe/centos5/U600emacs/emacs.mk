include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf emacs-*.* && \
	tar zxf $(shell pwd)/emacs-*.*.tar.gz&& \
	cd emacs-*.*&& \
	./configure --prefix=$(SYSCON_PREFIX) \
	  --without-selinux \
	  --with-x=no --without-xpm --without-jpeg \
	 --without-png --without-gif --without-tiff &&\
	make -j16 &&\
	make install
	$(FINISH)

