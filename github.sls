{% set known_hosts = '/etc/ssh/ssh_known_hosts' %}

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

