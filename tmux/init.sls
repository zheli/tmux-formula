{% from "tmux/map.jinja" import tmux with context %}

tmux-ppa:
  pkgrepo.managed:
    - ppa: pi-rho/dev
  pkg.installed:
    - name: tmux
    - version: 2.0-1~ppa1~t
    - refresh: True

tmux_conf:
  file.managed:
    - name: {{ salt['pillar.get']('tmux.config_path', tmux.tmux_conf) }}
    - source: salt://tmux/files/.tmux.conf
    - require:
      - pkg: tmux
