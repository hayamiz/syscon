
include $(SYSCON_INCLUDE)/common.mk

install_packages :=				\
	redhat-lsb				\
	ethtool					\
	kernel-headers				\
	trousers				\
	zsh					\
	sysstat					\
	numactl-devel				\
	libaio-devel				\
	fipscheck				\
	keyutils				\
	systemtap				\
	kernel-devel				\
	kernel-debuginfo			\
	glibc-devel

erase_packages :=				\
	aspell					\
	cpuspeed

$(SYSCON_TARGET):
	echo "#!/bin/bash" > /tmp/yum.sh
	zypper -y install $(install_packages)
	zypper -y remove $(erase_packages)
	$(FINISH)
