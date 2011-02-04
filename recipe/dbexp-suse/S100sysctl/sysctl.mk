
include $(SYSCON_INCLUDE)/common.mk

sysctl_conf := /etc/sysctl.conf

$(SYSCON_TARGET):
	if grep "^ *kernel.panic" $(sysctl_conf) > /dev/null; then \
	  sed -ibak -e 's/^ *kernel.panic.*/kernel.panic = 10/g' $(sysctl_conf); \
	else \
	  echo kernel.panic = 10 >> $(sysctl_conf); \
	fi
	$(FINISH)
