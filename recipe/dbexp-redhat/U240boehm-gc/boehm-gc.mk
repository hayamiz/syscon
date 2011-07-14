
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf gc-* &&\
	tar zxf $(shell pwd)/gc-*.tar.gz && \
	cd gc-* && \
	(cd libatomic_ops* &&\
	 ./configure --prefix=$(SYSCON_PREFIX) &&\
	 make -j 16 &&\
	 make install) &&\
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j8 && \
	make install
	$(FINISH)

