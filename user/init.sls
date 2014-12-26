include:
  - devtools

chsh -s /bin/zsh vagrant:
  cmd.run
  
zshenv:
  file.managed:
    - name: /home/vagrant/.zshenv
    - user: vagrant
    - group: vagrant
    - mode: 644
    - source: salt://user/zshenv
zshrc:
  file.managed:
    - name: /home/vagrant/.zshrc
    - user: vagrant
    - group: vagrant
    - mode: 644
    - source: salt://user/zshrc

