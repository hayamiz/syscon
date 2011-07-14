
include $(SYSCON_INCLUDE)/common.mk

install_packages :=				\
	redhat-lsb				\
	ethtool					\
	kernel-headers				\
	trousers				\
	zsh					\
	sysstat					\
	yum-utils				\
	numactl-devel				\
	libaio-devel				\
	fipscheck				\
	keyutils				\
	systemtap				\
	systemtap-sdt-devel			\
	systemtap-runtime			\
	kernel-devel				\
	kernel-debuginfo			\
	glibc-devel

erase_packages :=				\
	aspell					\
	cpuspeed

$(SYSCON_TARGET):
	echo "#!/bin/bash" > /tmp/yum.sh
	echo yum -q -y install $(install_packages) >> /tmp/yum.sh
	echo yum -q -y erase $(erase_packages) >> /tmp/yum.sh
	bash /tmp/yum.sh
	stap-prep
	$(FINISH)
