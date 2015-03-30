# vim: syntax=yaml:ts=2:sw=2:expandtab

datastaxrepo:
  pkgrepo.managed:
    - humanname: Datastax
    - name: "deb http://debian.datastax.com/community stable main"
    - file: /etc/apt/sources.list.d/datastax.community.list
    - key_url: "http://debian.datastax.com/debian/repo_key"

