
include $(SYSCON_INCLUDE)/common.mk

install_packages :=				\
	redhat-lsb				\
	ethtool					\
	kernel-headers				\
	trousers				\
	zsh					\
	sysstat					\
	yum-utils				\
	keyutils				\
	emacs					\
	emacs-el				\
	screen					\
	glibc-devel

$(SYSCON_TARGET):
	yum -y install $(install_packages)
	$(FINISH)

