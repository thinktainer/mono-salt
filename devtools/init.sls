mypkgs:
  pkg.installed:
    - pkgs:
      - vim
      - zsh
      - curl
      - tmux

git:
  pkg.installed

prompt_pure:
  file.managed:
    - name: /home/vagrant/.zshfunctions/prompt_pure_setup
    - source: https://raw.githubusercontent.com/sindresorhus/pure/v0.4.0/pure.zsh
    - source_hash: sha512=602db6b8de3063b2bedd6615f3cd56ce8b5e0ac723eee4fa152be19994764a15b2a1e75619d34f78e261329b352e646cc1c97def9b0720de7f0824ba8920f08b
    - user: vagrant
    - group: vagrant
    - mode: 755
    - makedirs: True

