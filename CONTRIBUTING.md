# Contributing

Keep this component focused on the Qubes Builder interface for the Guix
template.

- Keep release-config URLs generic until a maintainer or Qubes-owned fork is
  selected.
- Do not commit generated RPMs, root images, logs, caches, cloud test setup, or
  local environment paths.
- Prefer behavior tests that exercise generated artifacts or script contracts.
- Keep Guix input selection explicit through `config/channels.scm` for release
  builds.
- Treat `guix-system-contract-check` as optional unless the test environment has
  Guix installed.
