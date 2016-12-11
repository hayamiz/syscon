
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cp jq-linux64 $(SYSCON_PREFIX)/bin/jq && \
	$(FINISH)

