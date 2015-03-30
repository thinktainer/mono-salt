# vim: syntax=yaml:ts=2:sw=2:expandtab

include:
  - datastax.repo

opscenter:
  pkg.installed:
    - require:
      - sls: datastax.repo
    - require_in:
      - service: opscenterd

opscenterd:
  service.running

