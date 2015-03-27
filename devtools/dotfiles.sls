# vim: syntax=yaml:ts=2:sw=2:expandtab

{% set user = pillar.get('developer_user')%}

/home/{{user}}/.tmux.conf:
  file.managed:
    - source: salt://devtools/dotfiles/tmux.conf
    - user: {{user}}
    - group: {{user}}

