include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp&& \
	rm -rf emacs-*.* && \
	tar xf $(shell pwd)/emacs-*.*.tar.xz && \
	cd emacs-*.*&& \
	./configure --prefix=$(SYSCON_PREFIX) \
	  --with-x=no --with-xpm=no --with-jpeg=no \
	 --with-png=no --with-gif=no --with-tiff=no &&\
	make -j16 &&\
	make install
	$(FINISH)

