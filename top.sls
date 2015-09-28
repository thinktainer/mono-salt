# vim: ft=sls:ts=2:sw=2:expandtab

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
    - erlang
    - elasticsearch

  'node_type:scala_development':
    - match: grain
    - webupd8java
    - scala
    - intellij
    - gradle
    - user

  'node_type:python_development':
    - match: grain
    - webupd8java
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

  'node_type:es_kafka_devbox':
    - match: grain
    - elasticsearch
    - kafka
    - redis
    - logstash

  'node_type:logging_old_dev':
    - match: grain
    - redis
    - logstash
    - elasticsearch

  'node_type:az-af':
    - match: grain
    - lamp

  'node_type:mono':
    - match: grain
    - mono
    - user
    - devtools

