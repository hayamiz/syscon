
include $(SYSCON_INCLUDE)/common.mk

install_packages :=				\
	ethtool					\
	kernel-source				\
	kernel-desktop-devel			\
	kernel-desktop-debuginfo		\
	kernel-desktop-debugsource		\
	kernel-desktop-base-debuginfo		\
	trousers				\
	zsh					\
	sysstat					\
	libnuma-devel				\
	libaio-devel				\
	keyutils				\
	systemtap				\
	glibc-devel

erase_packages :=				\
	aspell					\
	cpuspeed

$(SYSCON_TARGET):
	zypper modifyrepo --enable repo-debug
	zypper -y install $(install_packages)
	zypper -y remove $(erase_packages)
	$(FINISH)
