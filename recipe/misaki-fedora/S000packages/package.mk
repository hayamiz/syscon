
include $(SYSCON_INCLUDE)/common.mk

install_packages :=				\
	redhat-lsb				\
	ethtool					\
	gnuplot					\
	kernel-headers				\
	trousers				\
	zsh					\
	sysstat					\
	yum-utils				\
	numactl-devel				\
	libaio-devel				\
	screen					\
	mutt					\
	fipscheck				\
	keyutils				\
	glibc-devel

erase_packages :=				\
	aspell					\
	cpuspeed

$(SYSCON_TARGET):
	yes | yum install $(install_packages)
	yes | yum erase $(erase_packages)
	$(FINISH)
