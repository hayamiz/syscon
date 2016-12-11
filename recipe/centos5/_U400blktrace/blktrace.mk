
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf blktrace && \
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git && \
	cd blktrace && \
	sed -i -e 's/^prefix = \/usr\/local/prefix = /g' Makefile && \
	DESTDIR=$(SYSCON_PREFIX) make -j16 install
	$(FINISH)
