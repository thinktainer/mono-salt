# vim: syntax=yaml:ts=2:sw=2:expandtab

{% set user = pillar.get('developer_user', 'vagrant') %}
{% set gradle_version = pillar.get('gradle_version', '2.2.1') %}
{% set archive_name = pillar.get('gradle_archive_name', "gradle-" ~ gradle_version ~ '-all.zip') %}
{% set install_folder = 'gradle-' ~ gradle_version %}

include:
  - webupd8java

/home/{{user}}/lib:
  file.directory:
    - user: {{user}}
    - group: {{user}}
    - dir_mode: 755
    - require_in:
      archive.extracted: gradle

gradle:
  archive.extracted:
    - name: /home/{{user}}/lib
    - source: salt://packages/{{archive_name}}
    - archive_format: zip
    - archive_user: {{user}}
    - if_missing: /home/{{user}}/lib/{{install_folder}}
    - require:
      - sls: webupd8java

gradle_dir:
  file.directory:
    - name: /home/{{user}}/lib/{{install_folder}}
    - user: {{user}}
    - group: {{user}}
    - mode: 755
    - require:
      - archive: gradle
    - recurse:
      - user
      - group

/home/{{user}}/.gradle:
  file.symlink:
    - target: /home/{{user}}/lib/{{install_folder}}
    - user: {{user}}
    - group: {{user}}
    - require:
      - file: gradle_dir

