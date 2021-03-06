
include $(SYSCON_INCLUDE)/common.mk

install_packages :=				\
	linux-headers-$(shell uname -r)		\
	linux-image-$(shell uname -r)-dbg	\
	linux-tools				\
	systemtap				\
	ethtool					\
	trousers				\
	zsh					\
	sysstat					\
	libnuma-dev				\
	libaio-dev				\
	keyutils				\
	build-essential				\
	ntp					\
	iptables				\
	rsync					\
	gettext					\
	cmake					\
	cpufrequtils				\
	oprofile				\
	numactl					\
	libncurses5-dev

/tmp/apt.sh: package.mk
	echo "#!/bin/bash" > $@
	echo "apt-get install -y $(install_packages)" >> $@

$(SYSCON_TARGET): /tmp/apt.sh
	bash /tmp/apt.sh
	$(FINISH)
