
include $(SYSCON_INCLUDE)/common.mk

apt_sources := /etc/apt/sources.list

$(SYSCON_TARGET):
	if grep "^#" $(apt_sources) |grep http|grep partner > /dev/null; then \
	  sed -i.bak1 -e 's/^# *\(deb *http:.*partner.*\)/\1/g' $(apt_sources); \
	  sed -i.bak2 -e 's/^# *\(deb-src *http:.*partner.*\)/\1/g' $(apt_sources); \
	fi
	apt-get update
	$(FINISH)
