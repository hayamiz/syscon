
include $(SYSCON_INCLUDE)/common.mk

services =					\
	auditd					\
	cron					\
	canna					\
	cifs


$(SYSCON_TARGET):
	$(FINISH)