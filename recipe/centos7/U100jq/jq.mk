
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_PREFIX)/bin:
	mkdir -p $@

$(SYSCON_TARGET): $(SYSCON_PREFIX)/bin
	cp jq-linux64 $(SYSCON_PREFIX)/bin/jq && \
	$(FINISH)

