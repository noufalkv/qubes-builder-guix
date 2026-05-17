# Validation Notes

This file records validation for the split `qubes-builder-guix` component only.
It is not evidence that Qubes has accepted or published a Guix template.

## Scope

This repository contains the Builder-facing component shape:

- Builder v2 content hooks under `builder-v2-template/`;
- native Guix system definitions and Qubes VM package definitions under
  `native/`;
- rootfs and qvm-template RPM packaging scripts under `scripts/`;
- local contract tests under `tests/`.

It deliberately does not contain cloud test setup, nested-dom0 helpers, openQA
assets, generated root images, generated RPMs, signing keys, or release-config
metadata.  Runtime Qubes evidence belongs to the template review repository and
to the eventual release owner.

## Current Checks

Current local component check:

```sh
make check
```

Last refreshed on May 18, 2026 on the current `main` branch.  The check passed
and covered:

- public script CLI contracts;
- pinned-channel rootfs builder policy;
- Builder hook layout and outputs;
- Builder adapter root-image metadata;
- Builder adapter RPM output;
- normal and minimal qvm-template RPM layout extraction/reassembly.

When Guix is available, also run:

```sh
make guix-system-contract-check
```

That check instantiates the Guix system records and verifies Qubes-visible
defaults such as swap, passwordless sudo, default privileged programs, required
Qubes services, and `meminfo-writer` defaults.  It is optional in environments
without `guix` in `PATH`.

## Not Covered Here

The component checks do not prove:

- Qubes Builder v2 has accepted `dist: guix`;
- release-config publication is accepted;
- `qvm-template` lifecycle behavior in dom0;
- TemplateVM/AppVM qrexec, QubesDB, GUI, storage, swap, or memory-ballooning
  behavior;
- Guix downloads, substitutes, or `guix time-machine` through a real
  Internet-capable Qubes update target;
- centralized `qubes-vm-update` behavior.

Those gates must be proved in the template review repository and rerun from the
final publication branch or release object before requesting Qubes publication.
