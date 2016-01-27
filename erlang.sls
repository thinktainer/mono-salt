include:
  - erlang_solutions_repo

erlang:
  pkg.installed:
    - refresh: True
    - version: "1:18.2"
    - require:
      - sls: erlang_solutions_repo

erlang-base-hipe:
  pkg.installed:
    - version: "1:18.2"
    - requrie:
      - sls: erlang_solutions_repo

