# SPDX-License-Identifier: GPL-3.0-or-later
SHELL := /usr/bin/env bash

.PHONY: check script-cli-contract-check build-native-rootfs-policy-check builder-hook-contract-check builder-adapter-contract-check builder-rpm-contract-check rpm-layout-check guix-system-contract-check prepare build-rootimg build-rpm

check: script-cli-contract-check build-native-rootfs-policy-check builder-hook-contract-check builder-adapter-contract-check builder-rpm-contract-check rpm-layout-check

script-cli-contract-check:
	./tests/script-cli-contract-check.sh

build-native-rootfs-policy-check:
	./tests/build-native-rootfs-policy-check.sh

builder-hook-contract-check:
	./tests/builder-hook-contract-check.sh

builder-adapter-contract-check:
	./tests/builder-adapter-contract-check.sh

builder-rpm-contract-check:
	./tests/builder-rpm-contract-check.sh

rpm-layout-check:
	./tests/rpm-layout-check.sh

guix-system-contract-check:
	./tests/guix-system-contract-check.sh

prepare:
	@:

build-rootimg:
	./scripts/builder-v2-template-adapter.sh build-rootimg

build-rpm:
	./scripts/builder-v2-template-adapter.sh build-rpm
