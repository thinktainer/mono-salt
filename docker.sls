apt-transport-https:
  pkg.installed:
  - require_in:
    - pkgrepo: Docker Debian Archive

base:
  pkgrepo.managed:
    - humanname: Docker Debian Archive
    - name: deb https://apt.dockerproject.org/repo debian-jessie main
    - dist: debian-jessie
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: p80.pool.sks-keyservers.net
    - require_in:
      - pkg: docker-engine
  pkg.installed:
    - name: docker-engine

#/usr/local/bin/docker-compose:
  #file.managed:
    #- source: https://github.com/docker/compose/releases/download/1.5.1/docker-compose-Linux-x86_64
    #- source_hash: sha256=5b9b6287c95103a553f8902e1e607bf4cdae74466f66a78d25195252ba380b0e
    #- user: root
    #- group: root
    #- mode: '755'

