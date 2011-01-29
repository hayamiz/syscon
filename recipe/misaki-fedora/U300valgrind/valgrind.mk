
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cd /tmp && \
	rm -rf valgrind-* &&\
	tar xf $(shell pwd)/valgrind-*.tar.bz2 && \
	cd valgrind-* && \
	./configure --prefix=$(SYSCON_PREFIX) && \
	make -j8 && \
	make install
	$(FINISH)

