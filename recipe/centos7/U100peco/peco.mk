
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cp peco_linux_amd64/peco $(SYSCON_PREFIX)/bin && \
	$(FINISH)

