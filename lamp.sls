# vim: ft=sls:ts=2:sw=2:expandtab

lamp-pkgs:
  pkg.installed:
    - pkgs:
      - mysql-server
      - mysql-client
      - apache2
      - php5
      - php5-mysql
      - libapache2-mod-php5
      - phpmyadmin

