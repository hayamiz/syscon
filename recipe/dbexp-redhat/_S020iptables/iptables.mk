
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	bash iptables-clear.sh
	bash iptables-setup.sh
	$(FINISH)
