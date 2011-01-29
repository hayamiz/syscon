
include $(SYSCON_INCLUDE)/common.mk

install_packages := \
	ethtool

# erase_packages := \
# 	

$(SYSCON_TARGET):
	yum install $(install_packages)
ifdef erase_packages
	yum erase $(erase_packages)
endif
	touch $@