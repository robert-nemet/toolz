.PHONY: test

test: lint
	bats --tap tests

lint:
	shellcheck scripts/*.sh
