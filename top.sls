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
