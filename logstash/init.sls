# vim: ft=sls:ts=2:sw=2:expandtab

{% set logstash_version = salt['pillar.get']('logstash_version', '1.4') %}

include:
  - webupd8java

logstash-{{ logstash_version }}-repo:
  pkgrepo.managed:
    - humanname: Logstash apt repo
    - name: deb http://packages.elasticsearch.org/logstash/1.4/debian stable main
    - file: /etc/apt/sources.list.d/logstash-{{ logstash_version }}.list
    - key_url: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - require_in:
      - pkg: logstash

logstash-config:
  file.recurse:
    - source: salt://logstash/files
    - name: /etc/logstash/conf.d
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 744
    - require:
      - pkg: logstash
    - require_in:
      - service: logstash

logstash:
  pkg.installed:
    - require_in:
      logstash: service.running
  service.running:
    - require:
      - sls: webupd8java
    

