# vim: ft=sls:ts=2:sw=2:expandtab
base:
  pkgrepo.managed:
    - humanname: Xamarin Mono deb
    - name: deb http://download.mono-project.com/repo/debian wheezy main
    - key_url: http://download.mono-project.com/repo/xamarin.gpg
    - require_in:
      - pkg: mono-pkgs

mono-pkgs:
  pkg.installed:
    - pkgs:
      - mono-complete
      - fsharp
      
github.com:
  ssh_known_hosts:
    - present
    - user: root
    - fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
