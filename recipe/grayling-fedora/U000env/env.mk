
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET):
	if ! [ -d $(HOME)/env ]; then cd $(HOME); git clone ssh://hayamin.com/home/haya/git/env.git/; fi
	cd $(HOME)/env/dotfiles; ./setup.sh -y
	cd $(HOME)/env/conffiles; ./setup.sh -y
	$(FINISH)
