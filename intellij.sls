# vim: syntax=yaml:ts=2:sw=2:expandtab

{% set user = pillar.get('developer-user', 'vagrant') %}
{% set intellij_archive_name = pillar.get('intellij_archive_name', 'ideaIC-14.0.2.tar.gz') %}
{%set intellij_install_folder = pillar.get('intellij_install_folder', 'idea-IC-139.659.2')%}
    
untar_intellij:
  archive.extracted:
    - name: /home/{{user}}
    - source: salt://packages/{{intellij_archive_name}}
    - archive_format: tar
    - tar_options: xz
    - archive_user: {{user}}
    - if_missing: {{intellij_install_folder}}

chown_intellij:
  file.directory:
    - name: /home/{{user}}/{{intellij_install_folder}}
    - cwd: /home/{{user}}
    - user: {{user}}
    - group: {{user}}
    - mode: 755
    - require:
      - archive: untar_intellij
    - recurse:
      - user
      - group

/home/{{user}}/intellij:
  file.symlink:
    - target: /home/{{user}}/{{intellij_install_folder}}
    - cwd: /home/{{user}}
    - user: {{user}}
    - group: {{user}}

