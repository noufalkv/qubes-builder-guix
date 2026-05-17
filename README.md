# qubes-builder-guix

Builder component for a native GNU Guix System Qubes template.

This repository is a review-ready Builder-facing split of the Guix template
prototype.  It is intentionally small: it contains the Builder template hooks,
the Guix system definitions needed to create the root filesystem, qvm-template
RPM packaging, and contract tests for the Builder and RPM interfaces.
`VALIDATION.md` records which checks this split component can prove and which
runtime gates remain outside this repository.

It is not a canonical Qubes Project URL.  Release configs should keep using a
placeholder such as:

```yaml
components:
  - builder-guix:
      packages: False
      fetch-versions-only: false
      branch: main
      url: https://github.com/<OWNER>/qubes-builder-guix

templates:
  - guix:
      dist: guix
      timeout: 21600
  - guix-minimal:
      dist: guix
      flavor: minimal
      timeout: 21600
```

The intended upstream path is for Qubes maintainers or the eventual template
maintainer to adopt, fork, or replace this component URL during review.  This
repository can be used as the starting point for that review.

## Scope

The component builds two template variants:

- `guix`: normal GUI template with Qubes agents, Xorg, and
  `xfce4-terminal`.
- `guix-minimal`: minimal GUI template with Qubes agents, Xorg, and `xterm`.

The Builder v2 integration expects `dist: guix` support in `qubes-builderv2`.
The matching Builder-side patch should set `TEMPLATE_CONTENT_DIR` to the
fetched component's `builder-v2-template` directory and depend on the
`builder-guix` source fetch job.

## Local Checks

Run the non-dom0 contract tests:

```sh
make check
```

Run the Guix object contract when `guix` is available:

```sh
make guix-system-contract-check
```

Build a root image directly from this component:

```sh
make build-rootimg TEMPLATE_NAME=guix TEMPLATE_ROOT_SIZE=20G
```

Build a template RPM from a prepared root image:

```sh
make build-rpm TEMPLATE_NAME=guix TEMPLATE_VERSION=4.3.0
```

The direct `make build-rootimg`/`make build-rpm` targets are a convenience
wrapper around the same rootfs and RPM scripts used by the Builder hooks.  In
Builder v2, the generic template plugin calls the hooks in
`builder-v2-template/`.

## What Is Deliberately Not Here

This component does not contain cloud test setup, nested-dom0 helper scripts,
generated root images, generated RPMs, local logs, or signing keys.  Those are
environment-specific or release-process artifacts, not source for an upstream
Builder component.
