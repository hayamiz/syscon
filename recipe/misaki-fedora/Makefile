
TARGET_DEPS := $(shell find . -maxdepth 2 -mindepth 2 -name "*.mk"|sed -e 's/^\.\///g'|sort)
SUBTARGETS := $(shell echo $(TARGET_DEPS)|xargs -n1 dirname|uniq|while read dir; do echo $$(basename $$dir)/$(SYSCON_TARGET); done)

all: $(SYSCON_TARGET)

$(SYSCON_TARGET): $(TARGET_DEPS) $(SUBTARGETS)
	touch $@

%/$(SYSCON_TARGET): $(TARGET_DEPS)
	dir=$$(dirname $@); \
	if echo $$dir | grep '^S[0-9][0-9]*' > /dev/null; then \
	  $(SU_CMD) make -C $$dir -f $$(ls $$dir/*.mk|sort|head -1|xargs -n1 basename); \
	else \
	  make -C $$dir -f $$(ls $$dir/*.mk|sort|head -1|xargs -n1 basename); \
	fi

clean:
	rm -f $$(find . -name "$(SYSCON_TARGET)")
