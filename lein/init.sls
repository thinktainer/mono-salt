installer:
  file.managed:
    - name: /home/vagrant/bin/lein
    - source: https://raw.githubusercontent.com/technomancy/leiningen/2.5.0/bin/lein
    - source_hash: sha512=0d22c3552fcdae56b1d728f70617b0e4bf3030104e128df8e186e8511c5476a3cae5444d02c123e8bd544a81845411305448540d0d0a560231b72d32b77a571a
    - mode: 755
    - user: vagrant
    - group: vagrant
    - makedirs: true
    - require_in:
      - cmd: setup_lein

setup_lein:
  cmd.run:
    - name: /home/vagrant/bin/lein > /dev/null
    - cwd: /home/vagrant/bin
    - user: vagrant
    - group: vagrant
    - creates: /home/vagrant/.lein/self-installs/leiningen-2.5.0-standalone.jar

