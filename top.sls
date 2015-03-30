# vim: syntax=yaml:ts=2:sw=2:expandtab

base:
  'node_type:clojure_development':
    - match: grain
    - webupd8java
    - user
    - lein
    - devtools

  'node_type:java_development':
    - match: grain
    - webupd8java
    - desktop
    - intellij
    - gradle
    - user

  'node_type:scala_development':
    - match: grain
    - webupd8java
    - scala
    - intellij
    - gradle
    - user

  'node_type:datastax_opscenter':
    - match: grain
    - webupd8java
    - datastax.opscenter

  'node_type:cassandra_node':
    - match: grain
    - webupd8java
    - datastax.repo

  'node_type:elasticsearch':
    - match: grain
    - elasticsearch

