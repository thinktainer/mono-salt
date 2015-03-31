# vi: ft=sls:ts=2:sw=2

{% set scala_version = salt['pillar.get']('scala_version', '2.10.4') %}

include:
  - webupd8java

confluent-repo:
  pkgrepo.managed:
    - humanname: confluent.io kafka repository
    - name: "deb [arch=all] http://packages.confluent.io/deb/1.0 stable main"
    - dist: stable
    - file: /etc/apt/sources.list.d/confluent.io.list
    - key_url: "http://packages.confluent.io/deb/1.0/archive.key"
    - require_in:
      confluent-platform-{{ scala_version }}: pkg.installed

confluent-platform-{{ scala_version }}:
  pkg.installed

