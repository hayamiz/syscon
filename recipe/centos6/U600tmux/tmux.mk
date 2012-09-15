include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf tmux-*.* && \
	tar zxf $(shell pwd)/tmux-*.*.tar.gz&& \
	cd tmux-*.*&& \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j16 && \
	make install
	$(FINISH)

