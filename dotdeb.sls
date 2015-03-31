# vim: ft=sls:ts=2:sw=2:expandtab

dotdeb:
  pkgrepo.managed:
    - humanname: Dotdeb LAMP repository
    - name: deb http://mirror.stshosting.co.uk/dotdeb/ stable all
    - file: /etc/apt/sources.list.d/dotdeb.uk.list
    - key_url: http://www.dotdeb.org/dotdeb.gpg

