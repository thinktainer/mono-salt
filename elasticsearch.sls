# vim: ft=sls:ts=2:sw=2:expandtab

{% set es_version = salt['pillar.get']('elasticsearch_version', '1.5') %}
{% set config_file = '/etc/elasticsearch/elasticsearch.yml' %}

include:
  - webupd8java
  - kibana

elasticsearch{{ es_version }}-installer:
  pkgrepo.managed:
  {% if grains['os'] == 'Ubuntu' %}
    - ppa: webupd8team/java
  {% elif grains['os'] == 'Debian' %}
    - humanname: WebUp8Team Java Repository
    - name: "deb http://packages.elasticsearch.org/elasticsearch/{{ es_version }}/debian stable main"
    - dist: stable
    - file: /etc/apt/sources.list.d/elasticsearch-{{ es_version }}.list
    - keyid: D88E42B4
    - keyserver: pgp.mit.edu
  {% endif %}
    #- require_in:
      #elasticsearch: pkg.installed

elasticsearch-config:
  file.blockreplace:
    - name: {{ config_file }}
    - marker_start: "#################################### Paths ####################################"
    - marker_end: "#################################### Plugin ###################################"
    - show_changes: True
    - content: |
        path.conf: /etc/elasticsearch
        path.data: /var/lib/elasticsearch
        path.work: /tmp
        path.logs: /var/log/elasticsearch
        path.plugins: /usr/share/elasticsearch/plugins
    - require:
      - pkg: elasticsearch

/etc/default/elasticsearch:
  file.uncomment:
    - regex: CONF_DIR
    - require:
      - pkg: elasticsearch

elasticsearch:
  pkg.installed:
    - require_in:
      elasticsearch: service.running
    - require:
      - pkgrepo: elasticsearch{{ es_version }}-installer
    - refresh: True
  service.running:
    - require:
      - sls: webupd8java
    - enable: True
    - watch:
      - file: {{ config_file }}
      - file: /etc/default/elasticsearch

