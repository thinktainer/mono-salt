{% set known_hosts = '/etc/ssh/ssh_known_hosts' %}

git:
  pkg.installed

/etc/ssh:
  file.directory:
    - user: root
    - group: root
    - mode: 644
    - require_in:
      - cmd: ensure_github

ensure_github:
  cmd.run:
    - name: ssh-keyscan github.com > {{ known_hosts }}
    - user: root
    - group: root
    - creates: {{ known_hosts }}
    - notify:
      - cmd: known_hosts_permissions

known_hosts_permissions:
  cmd.run:
    - name: chmod 600 {{ known_hosts }}

ghconfig_user_name:
  git.config:
    - name: user.name
    - value: thinktainer
    - user: vagrant
    - is_global: True
    - require:
      - pkg: git

ghconfig_user_email:
  git.config:
    - name: user.email
    - value: m.schinz@gmail.com
    - user: vagrant
    - is_global: True
    - require:
      - pkg: git

ghconfig_core_editor:
  git.config:
    - name: core.editor
    - value: vim
    - user: vagrant
    - is_global: True
    - require:
      - pkg: git

ghconfig_core_excludesfile:
  git.config:
    - name: core.excludesfile
    - value: /home/vagrant/.gitignore
    - user: vagrant
    - is_global: True
    - require:
      - pkg: git

/home/vagrant/.gitignore:
  file.managed:
    - source: salt://github/gitignore
    - user: vagrant
    - group: vagrant
    - mode: 644

