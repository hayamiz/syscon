
include $(SYSCON_INCLUDE)/common.mk

services =					\
	firstboot

$(SYSCON_TARGET):
	for serv in $(services); do \
	  if service $$serv status | grep running > /dev/null; then service $$serv stop; fi; \
	  chkconfig $$serv off || exit 1; \
	done
	$(FINISH)
