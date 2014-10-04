export SHELL := /bin/bash
export PATH := $(shell npm bin):$(PATH)

all: index.js

%.js: %.ls
	lsc -c $<

test: test.ls index.js
	mocha -r LiveScript -u exports test.ls

.PHONY: test
