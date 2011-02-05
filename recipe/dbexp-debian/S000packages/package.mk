
include $(SYSCON_INCLUDE)/common.mk

install_packages :=				\
	linux-headers-$(shell uname -r)		\
	linux-image-$(shell uname -r)-dbg	\
	systemtap				\
	ethtool					\
	trousers				\
	zsh					\
	sysstat					\
	libnuma-dev				\
	libaio-dev				\
	keyutils				\
	build-essential				\
	ntp \
	iptables \
	cpufrequtils

/tmp/apt.sh: package.mk
	echo "#!/bin/bash" > $@
	echo "apt-get install -y $(install_packages)" >> $@

$(SYSCON_TARGET): /tmp/apt.sh
	bash /tmp/apt.sh
	$(FINISH)
