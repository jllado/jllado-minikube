### Server
- sudo apt install openssh-server
- ssh-keygen -t rsa (Generate private/public key)
### Host
- sudo apt install ansible
- Add jllado-server host to /etc/ansible/hosts
- ssh-copy-id jllado@jllado-server
- ansible-playbook --limit jllado-server jllado_kubernetes_playbook.yml --ask-become-pass  [--tags "any_tag"]
