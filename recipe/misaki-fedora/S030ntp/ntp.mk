
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	cp /etc/ntp.conf /etc/ntp.conf.bak$$(date '+%Y%m%d-%H%M%S')
	sed -i -e s'/^server/# server/g' /etc/ntp.conf
	sed -i -e s'/^fudge/# fudge/g' /etc/ntp.conf
	if ! grep yebis.tkl.iis.u-tokyo.ac.jp /etc/ntp.conf; then \
	  echo server yebis.tkl.iis.u-tokyo.ac.jp >> /etc/ntp.conf; \
	fi
	service ntpd restart
	$(FINISH)
