include:
  - devtools
  - oh_my_zsh

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

