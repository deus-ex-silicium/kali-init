# Ansible bootstrap and Kali setup roles

## Common commands
### ping check
`ansible all -m ping -u [user] -i [ip],`
 
### run main.yaml over password based ssh
`ansible-playbook main.yaml -Kk -u [user] -i [ip],`
 - requires that sshpass package is installed
 - requires that main.yaml has hosts: all

### run main.yaml over key based ssh
`ansible-playbook main.yaml --private-key [path] -u [user] -i [ip],`
 - requires that main.yaml has hosts: all
 - and that key has perms chmod 0400 key.pem
 
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
### setup_firefox
- installs and configures firefox and plugins
### setup_networking
- installs and configures uncomplicated firewall (ufw)

## Big shout-out to all the original developers of the tools this project makes use of <3