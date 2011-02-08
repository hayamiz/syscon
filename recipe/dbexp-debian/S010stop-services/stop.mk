
include $(SYSCON_INCLUDE)/common.mk

services =					\
	cron


$(SYSCON_TARGET):
	for serv in $(services); do \
	  update-rc.d $$serv disable; \
	done
	$(FINISH)