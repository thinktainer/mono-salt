# vim: syntax=yaml:ts=2:sw=2:expandtab
base:
  pkgrepo.managed:
    - humanname: Xamarin Mono deb
    - name: deb http://download.mono-project.com/repo/debian wheezy main
    - key_url: http://download.mono-project.com/repo/xamarin.gpg
    - require_in: 
      - pkg: mono-devel

mono-devel:
  pkg.installed:
  - require:
    - pkg: mypkgs

mypkgs:
  pkg.installed:
    - pkgs:
      - vim
      - autoconf
      - git
      - build-essential

github.com:
  ssh_known_hosts:
    - present
    - user: root
    - fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48


/home/vagrant/build/fsharp:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 755
    - makedirs: True

https://github.com/fsharp/fsharp.git:
  git.latest:
    - rev: fsharp_31
    - target: /home/vagrant/build/fsharp
    - user: vagrant
    - require:
      - pkg: mypkgs
      - ssh_known_hosts: github.com
      - file: /home/vagrant/build/fsharp

autogen-fsharp:
  cmd.run:
    - name: /home/vagrant/build/fsharp/autogen.sh --prefix=/usr
    - cwd: /home/vagrant/build/fsharp
    - user: vagrant
    - watch:
      - git: https://github.com/fsharp/fsharp.git
      
make-fsharp:
  cmd.run:
    - name: make
    - cwd: /home/vagrant/build/fsharp
    - user: vagrant
    - require:
      - cmd: autogen-fsharp
        
