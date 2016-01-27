zsh:
  pkg.installed:
  - require_in:
    - cmd: chsh -s /bin/zsh vagrant

chsh -s /bin/zsh vagrant:
  cmd.run
  
zshenv:
  file.managed:
    - name: /home/vagrant/.zshenv
    - user: vagrant
    - group: vagrant
    - mode: 644
    - source: salt://user/zshenv
    - template: jinja
    - defaults:
      user_path: '"$HOME/bin" $path'

