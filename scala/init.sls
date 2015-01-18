# vim: syntax=yaml:ts=2:sw=2:expandtab

{% set scala_version = pillar.get('scala_version', '2.10.4') %}

include:
  - webupd8java

scala-deps:
  pkg.installed:
    - pkgs:
      - libjansi-java
      - libjansi-native-java 
      - libhawtjni-runtime-java

scala:
  pkg.installed:
    - sources:
      - scala: salt://packages/scala-{{scala_version}}.deb
    - require:
      - sls: webupd8java
      - pkg: scala-deps

