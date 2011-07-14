
include $(SYSCON_INCLUDE)/common.mk

services =					\
	auditd					\
	anacron					\
	cups					\
	gpm					\
	pcscd					\
	avahi-daemon				\
	cgconfig				\
	crond					\
	firstboot				\
	tcsd

$(SYSCON_TARGET):
	for serv in $(services); do \
	  if service $$serv status | grep running > /dev/null; then service $$serv stop; fi; \
	  chkconfig $$serv off || exit 1; \
	done
	$(FINISH)