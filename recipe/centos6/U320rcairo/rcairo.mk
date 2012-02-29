
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	$(SYSCON_PREFIX)/bin/gem install cairo
	$(FINISH)

