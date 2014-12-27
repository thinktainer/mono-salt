include:
  - github

https://github.com/robbyrussell/oh-my-zsh.git:
  git.latest:
    - rev: master
    - target: /home/vagrant/.oh-my-zsh
    - user: vagrant
    - require:
      - sls: github
      - pkg: git

/home/vagrant/.zshrc:
  file.managed:
    - source: salt://oh_my_zsh/oh_my_zshrc
    - user: vagrant
    - group: vagrant
    - mode: 644
    
