# Ansible SymPortal

Ansible collection for SymPortal project.

LICENSE: 3-clause BSD license.

## Usage

To install and configure Docker on the new machine:

```commandline
ansible-playbook -i inventory/prod.ini install_docker.yml --ask-become-pass
```

To deploy SymPortal:

```commandline
ansible-playbook -i inventory/dev.ini deploy_symportal.yml --ask-become-pass
ansible-playbook -i inventory/test.ini deploy_symportal.yml --ask-become-pass

ansible-playbook \
    -i inventory/prod.ini deploy_symportal.yml \
    -e pg_user='' -e pg_db='' \
    --ask-become-pass
```

## CONTRIBUTING

```commandline
git clone git@github.com:greenjune-ship-it/symportal-ansible
```

---
Copyright © 2023, Yulia Iakovleva
