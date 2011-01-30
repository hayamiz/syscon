
include $(SYSCON_INCLUDE)/common.mk

medibuntu_packages :=				\
	libdvdcss2				\
	non-free-codecs

repofile := /etc/apt/sources.list.d/medibuntu.list

$(SYSCON_TARGET): $(repofile)
	apt-get install -y $(medibuntu_packages)
	$(FINISH)

$(repofile):
	wget -O $(repofile) http://www.medibuntu.org/sources.list.d/$$(lsb_release -cs).list
	apt-get --quiet update
	apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring
	apt-get --quiet update
