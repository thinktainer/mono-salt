# vim: syntax=yaml:ts=2:sw=2:expandtab

{% set user = pillar.get('developer-user', 'vagrant') %}
{% set archive_name = pillar.get('intellij_archive_name', 'ideaIC-14.0.2.tar.gz') %}

/home/{{user}}/{{archive_name}}:
  file.managed:
    - source: salt://packages/{{archive_name}}
    - user: {{user}}
    - group: {{user}}
    - require_in:
      - module: untar_intellij
    
untar_intellij:
  module.run:
    - name: archive.tar
    - tarfile: {{archive_name}}
    - options: xzf
    - cwd: /home/{{user}}
    - unless:
      - stat -t /home/{{user}}/idea* > /dev/null 2>&1
