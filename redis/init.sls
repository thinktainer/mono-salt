# vim: ft=sls:ts=2:sw=2:expandtab

include:
  - dotdeb

redis-server:
  pkg.installed:
    - require:
      - pkgrepo: dotdeb
    - require_in:
      redis-server: service.running
  service.running:
    - watch:
      - file: /etc/redis/redis.conf
    - enable: True

/etc/redis/redis.conf:
  file.replace:
    - pattern: ^\s*bind 127\.0\.0\.1\s*$
    - repl: bind 0.0.0.0
    - require:
      - pkg: redis-server

