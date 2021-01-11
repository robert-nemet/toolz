.PHONY: test

test:
	bats --tap tests

lint:
	shellcheck scripts/*.sh
