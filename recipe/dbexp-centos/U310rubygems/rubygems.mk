
include $(SYSCON_INCLUDE)/common.mk

gems :=						\
	popen4					\
	wirble

$(SYSCON_TARGET):
	gem install $(gems)
	$(FINISH)
