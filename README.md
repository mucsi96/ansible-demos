# ansible-demos
Demo project for Ansible

## Create box

```bash
vagrant up
```

## Run Ansible playbooks

```bash
ap playbooks/enable_root_login.yaml playbooks/new-ssh-user.yaml playbooks/ssh-hardening.yaml playbooks/update-packages.yaml playbooks/deploy-cluster.yaml
```

## Destroy the box

```bash
vagrant destroy
./clean.sh
```

# Resources

https://www.suse.com/c/rancher_blog/deploying-k3s-with-ansible/
https://fabianlee.org/2021/09/12/kubernetes-k3s-cluster-on-ubuntu-using-ansible/
http://blog.sozinov.eu/2021/01/02/K3s-on-Virtualbox.html
https://github.com/cerico/contabo
https://blog.weltraumschaf.de/blog/Hardening-Your-SSHd-with-Ansible/