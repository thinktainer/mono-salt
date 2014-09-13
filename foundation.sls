# vim: syntax=yaml:ts=2:sw=2:expandtab

foundation-packages:
  pkg.installed:
    - sources:
      - foundationdb-clients: https://foundationdb.com/downloads/f-oaoxuuixofbxobf/I_accept_the_FoundationDB_Community_License_Agreement/key-value-store/2.0.9/foundationdb-clients_2.0.9-1_amd64.deb
      - foundationdb-server: https://foundationdb.com/downloads/f-oaoxuuixofbxobf/I_accept_the_FoundationDB_Community_License_Agreement/key-value-store/2.0.9/foundationdb-server_2.0.9-1_amd64.deb

java-runtime:
  pkg.installed:
    - pkgs:
      - openjdk-7-jre-headless

foundation-sql-layer:
  pkg.installed:
    - sources:
      - fdb-sql-layer: https://foundationdb.com/downloads/f-oaoxuuixofbxobf/I_accept_the_FoundationDB_Community_License_Agreement/sql-layer/2.0.0/fdb-sql-layer_2.0.0-1_all.deb
    - require:
      - pkg: java-runtime

