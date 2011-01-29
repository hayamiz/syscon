
include $(SYSCON_INCLUDE)/common.mk

packages := \
	kernel-$(shell uname -r) # for systemtap

$(SYSCON_TARGET):
	yes | debuginfo-install $(packages)
	$(FINISH)
