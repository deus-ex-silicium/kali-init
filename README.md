# Ansible bootstrap and Kali setup roles

## Common commands
### ping check
`ansible all -m ping -u kali -i 127.0.0.1,`
 
### run main.yaml over password based ssh
`ansible-playbook main.yaml -Kk -u kali -i 127.0.0.1,`
 - requires that sshpass package is installed
 - requires that main.yaml has hosts: all

### run main.yaml over key based ssh
`ansible-playbook main.yaml -K -u kali --private-key ~/.ssh/id_ed25519 -i 127.0.0.1,`
 - `ssh-keygen -t ed25519 -a 100 & cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys`
 - and that key has perms chmod 0400 key.pem
 - requires that main.yaml has hosts: all
 
 ### Troubleshooting
 `rm -rf ~/.ansible/cp`
 - if playbook gets stuck, clear cp dir

 list of ansible facts and vars
 - https://www.middlewareinventory.com/blog/ansible-facts-list-how-to-use-ansible-facts/

## Roles
### setup_env
- configures oh-my-zsh and plugins (.zshrc, .zsh_aliases)
- configures vim and plugins (.vimrc)
- configures tmux and plugins (.tmux.conf)
- installs commonly used apt packages
- installs miniconda and creates common venvs: frida, drozer, pwn
- installs and configures go, rust and java
- improved cli: prettyping, ncdu, delta, tldr, exa, bat
- pentest tools: gobuster, nmapAutomator, gdb-multiarch and gef
- and more!

Notes:
- proper tmux navigation requires MATE Terminal with menu access shortcut keys disabled
- find out how to deploy keyboard shortcuts, for now manually map Super+T -> mate-terminal -x tmux
### setup_firefox
- installs and configures firefox and plugins
### setup_networking
- installs and configures uncomplicated firewall (ufw)

## Big shout-out to all the original developers of the tools this project makes use of <3