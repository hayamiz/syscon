
include $(SYSCON_INCLUDE)/common.mk

install_packages :=				\
	zsh					\
	screen					\
	emacs23					\
	emacs23-el				\
	ddskk					\
	sun-java6-bin				\
	sun-java6-jdk				\
	sun-java6-jre

$(SYSCON_TARGET):
	apt-get install -y $(install_packages)
	$(FINISH)
