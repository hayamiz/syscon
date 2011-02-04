
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
	m4					\
	gcc					\
	gcc-c++					\
	glibc-devel

/tmp/zypper.sh: package.mk
	echo "#!/bin/bash" > $@
	echo "zypper install -t pattern devel_C_C++" >> $@
	echo "zypper modifyrepo --enable repo-debug" >> $@
	echo "yes | zypper install $(install_packages)" >> $@
	false

$(SYSCON_TARGET): /tmp/zypper.sh
	$(FINISH)
