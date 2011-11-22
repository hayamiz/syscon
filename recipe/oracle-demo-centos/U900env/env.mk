
include $(SYSCON_INCLUDE)/common.mk

$(SYSCON_TARGET): $(HOME)/env
	cd $</dotfiles && ./setup.sh -y
	cd $</conffiles && ./setup.sh -y
	$(FINISH)

$(HOME)/env:
	cd $(HOME) && git clone ssh://haya@hayamin.com/home/haya/git/env.git/
