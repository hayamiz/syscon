
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd $(SYSCON_BUILDDIR) && \
	rm -rf cpufrequtils-* &&\
	tar zxf $(shell pwd)/cpufrequtils-*.tar.gz && \
	cd cpufrequtils-* && \
	make -j16 && \
	DESTDIR="$(SYSCON_PREFIX)/../" make install
	$(FINISH)

