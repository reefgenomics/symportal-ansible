# Ansible SymPortal

Ansible collection for SymPortal project.

LICENSE: 3-clause BSD license.

## Usage

To install and configure Docker on the new machine:

```commandline
ansible-playbook -i inventories/inventory.ini playbooks/install_docker.yml --ask-become-pass
```

To deploy SymPortal:

```commandline
ansible-playbook -i inventory.ini ...

```

## CONTRIBUTING

```commandline
git clone git@github.com:greenjune-ship-it/symportal-ansible
```

---
Copyright © 2023, Yulia Iakovleva
