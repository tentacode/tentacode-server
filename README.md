# tentacode-server

## Setup ssh authentication

### Connect via ssh

```
ssh root@tentacode.net
```

### Add the user gabriel with sudo privileges

```bash
adduser gabriel
```

Setting sudo privileges

```bash
apt-get install sudo
visudo
```

Add your user after root:

```
root       ALL=(ALL:ALL) ALL
gabriel    ALL=(ALL:ALL) NOPASSWD:ALL
```

Add user public ssh key:

```bash
su gabriel
mkdir ~/.ssh
vi ~/.ssh/authorized_keys
```

And copy content of your local `~/.ssh/id_rsa.pub`.

## Setup Ansible

### On server

You need python 2.5 > to run Ansible on the node:

```bash
sudo apt-get install python
```

### On control machine

Install last stable `Ansible` on Mac OS via  `pip`:

```bash
sudo pip install ansible
```

To ensure that ansible is properly setup, run:

```bash
ansible -i hosts all -m ping
```

## Setup the server

Copy `credentials.yml.dist` into `credentials.yml` and set proper values.

Launch playbook with `ansible-playbook -i hosts setup-webserver.yml`
