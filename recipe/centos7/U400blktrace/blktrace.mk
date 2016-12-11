
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf blktrace && \
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git && \
	cd blktrace && \
	sed -i -e 's/^prefix = \/usr\/local/prefix = /g' Makefile && \
	sed -i -e 's/-Wunused-result//g' iowatcher/Makefile && \
	DESTDIR=$(SYSCON_PREFIX) make install
	$(FINISH)
