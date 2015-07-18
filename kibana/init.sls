
kibana_distribution:
  archive.extracted:
    - name: /opt/kibana/
    - source: https://download.elastic.co/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz
    - source_hash: https://download.elastic.co/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz.sha1.txt
    - archive_format: tar
    - tar_options:  "-z -v --strip-components=1"
    - if_missing: /opt/kibana/

/opt/kibana/bin/kibana.sh:
  file.managed:
    - mode: 755
    - require_in:
      - service: kibana4

/etc/systemd/system/kibana4.service:
  file.managed:
    - source: salt://kibana/files/kibana.service.jinja
    - template: jinja
    - require:
      - archive: kibana_distribution
    - require_in:
      service: kibana4


kibana4:
  service.running:
    - enable: True

