
include $$SYSCON_INCLUDE/commonvars.mk

$(SYSCON_TARGET): $$(ls S*/*.mk) $$(ls S*/*.mk)
	# make targets with root priviledges
	for dir in $$(ls|grep "^S[0-9][0-9]*"); do \
	  if ls $$dir | grep "\.mk" > /dev/null; then \
	    makefile=$$(ls $$dir | grep "\.mk"|sort|head -1); \
	    $(SU_CMD) make -C $$dir -f $$makefile $(SYSCON_TARGET); \
	  fi; \
	done
	
	# make rest targets
	for dir in $$(ls|grep "^U[0-9][0-9]*"); do \
	  if ls $$dir | grep "\.mk" > /dev/null; then \
	    makefile=$$(ls $$dir | grep "\.mk"|sort|head -1); \
	    $(SU_CMD) make -C $$dir -f $$makefile $(SYSCON_TARGET); \
	  fi; \
	done