SHELL := /usr/bin/env bash -o pipefail

UNAME_OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
UNAME_ARCH := $(shell uname -m)
ifeq ("$(UNAME_ARCH)", "x86_64")
UNAME_ARCH="amd64"
endif

CACHE_BASE := $(HOME)/.cache/tooling
CACHE := $(CACHE_BASE)/$(UNAME_OS)/$(UNAME_ARCH)
CACHE_BIN := $(CACHE)/bin
CACHE_VERSIONS := $(CACHE)/versions

export PATH := $(abspath $(CACHE_BIN)):$(PATH)

show-versions:
	@echo "Installed tools:"
	@cd $(CACHE_VERSIONS) && find . -type f  | cut -b 3-