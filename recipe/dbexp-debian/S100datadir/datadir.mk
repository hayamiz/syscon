
include $(SYSCON_INCLUDE)/common.mk

TARGET_DIR := /data/local/$(SYSCON_USER)/$(shell hostname -s)
BUILD_DIR := /data/local/$(SYSCON_USER)/syscon-build

$(TARGET_DIR):
	mkdir -p $@

$(SYSCON_TARGET): $(TARGET_DIR) $(BUILD_DIR)
	chown $(SYSCON_USER) -R $$(dirname $<)
	$(FINISH)
