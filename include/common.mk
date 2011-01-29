
include commonvars.mk

$(SYSCON_TARGET): $(ls | grep -v OK)
