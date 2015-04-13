# vim: ft=sls:ts=2:sw=2:expandtab

{% set es_version = salt['pillar.get']('elasticsearch_version', '1.5') %}

include:
  - webupd8java

elasticsearch{{ es_version }}-installer:
  pkgrepo.managed:
  {% if grains['os'] == 'Ubuntu' %}
    - ppa: webupd8team/java
  {% elif grains['os'] == 'Debian' %}
    - humanname: WebUp8Team Java Repository
    - name: "deb http://packages.elasticsearch.org/elasticsearch/1.5/debian stable main"
    - dist: stable
    - file: /etc/apt/sources.list.d/elasticsearch-{{ es_version }}.list
    - keyid: D88E42B4
    - keyserver: pgp.mit.edu
  {% endif %}
    - require_in:
      elasticsearch: pkg.installed
      

elasticsearch:
  pkg.installed:
    - require_in:
      elasticsearch: service.running
  service.running:
    - require:
      - sls: webupd8java
    - enable: True

