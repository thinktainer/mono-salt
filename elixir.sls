include:
  - erlang_solutions_repo

elixir:
  pkg.installed:
    - require:
      - sls: erlang_solutions_repo
    
