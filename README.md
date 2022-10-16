# ansible-demos
Demo project for Ansible

## Hardening Server Security

### Change Root Password

```bash
sudo -i
passwd
```

### Change SSH Port

```bash
sudo -i
vi /etc/ssh/sshd_config
# Find the line containing Port 22.
# Replace the number with any value from 1024 to 65536 (command “I” in the vi editor). If there is a hashtag symbol next to “Port”, erase it.
systemctl restart ssh
ufw allow <PORT_NUMBER>/tcp
```

### Use SSH Key Authentication

```bash
# From local machine
ssh-keygen -t rsa
# As filename provide <SERVER_NAME>_ed25519
ssh-copy-id -p<YOUR_PORT_NUMBER><YOUR_USERNAME>@<YOUR_IP>

```

### Perform update

```bash
sudo apt-get update # update package index files
sudo apt-get upgrade # upgrade version of the operating system
```


# Resources

https://www.suse.com/c/rancher_blog/deploying-k3s-with-ansible/
https://fabianlee.org/2021/09/12/kubernetes-k3s-cluster-on-ubuntu-using-ansible/
http://blog.sozinov.eu/2021/01/02/K3s-on-Virtualbox.html
https://github.com/cerico/contabo
https://blog.weltraumschaf.de/blog/Hardening-Your-SSHd-with-Ansible/