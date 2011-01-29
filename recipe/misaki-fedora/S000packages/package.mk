
include $(SYSCON_INCLUDE)/common.mk

install_packages :=				\
	ethtool					\
	gnuplot

erase_packages := \
	aspell

$(SYSCON_TARGET):
	yes | yum install $(install_packages)
	yes | yum erase $(erase_packages)
	$(FINISH)
