
include $(SYSCON_INCLUDE)/common.mk

TARGET_DIR := /data/local/$(SYSCON_USER)/$(shell hostname -s)

$(TARGET_DIR):
	mkdir -p $@
	chown $(SYSCON_USER) $@

$(SYSCON_TARGET): $(TARGET_DIR)
	$(FINISH)
