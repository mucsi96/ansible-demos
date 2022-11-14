### Install VirtualBox
### Download Ubuntu Server image
### Create new VM and mount server image as CD
### Install Ubuntu server
### Login with user
### Set root password

First, you need to enter your user password ( given that you are part of the sudo administration group ) after which enter and retype a new root password

```bash
sudo passwd
```

All done, you should now be ready to login with a new root password. Try it now:

```bash
su
```

```bash
whoami
exit
```

### Login as root

```bash
exit
```

Login as root

### Enable SSH in VirtualBox

In VirtualBox click on Machine > Settings and go to Network.
Make sure you have the settings Attached to NAT.
Then go to Advanced -> Port Forwarding and add these settings:

```
Name: ssh (or whatever you like)
Protocol: TCP
Host Port: 2222 (or any other port you like)
Gust port: 22
```

The IP fields can be left empty.

### Enable root login to SSH

Edit the sshd_config file in `/etc/ssh/sshd_config`

```bash
nano /etc/ssh/sshd_config
```

Add a line in the Authentication section of the file that says `PermitRootLogin yes`.
Then restart the SSH server

```bash
service sshd restart
```

### Login as root over SSH

```bash
ssh -p 2222 root@localhost
```


# Simulate Contabo server with Vagrant

### Initialize Vagrant

```bash
vagrant init bento/ubuntu-22.04
```

### Run Vagrant box

```bash
vagrant up
```

### SSH into the box

```bash
ssh -p 2222 vagrant@192.168.56.11
```

passowrd is `vagrant`



