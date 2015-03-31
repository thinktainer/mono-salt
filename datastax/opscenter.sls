# vim: ft=sls:ts=2:sw=2:et

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

