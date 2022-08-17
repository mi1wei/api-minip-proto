help:
	@echo 'Management commands for BBS:'
	@echo
	@echo 'Usage:'
	@echo '    make clean                             	Clean gen'
	@echo '    make breakcheck                    		Check breaking change'
	@echo '    make update            					Update the buf deps'
	@echo '    make lint                              	Lint the code'
	@echo '    make gen                              	Generate the target SDK code'

.PHONY: update
update:
	buf mod update proto/miniprogram

.PHONY: lint
lint:
	buf lint

.PHONY: breakcheck
breakcheck:
	buf breaking --against proto.bin

.PHONY: gen
gen: clean
	buf generate

.PHONY: clean
clean:
	rm -rf gen