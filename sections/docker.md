# Install docker
## repository

[Oficcial instructions](https://docs.docker.com/install/linux/docker-ce/ubuntu/)


#### Mint
```bash
# For Linux Mint Rebecca 17.1
# replace one line in ^above bash recipe^
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
# For Linux Mint 18 "Sarah" (and other based on Ubuntu Xenial 16.04)
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
# or Linux Mint 19 "Tara" and "Tina"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get install -y docker-ce
# All LMs
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
## or
sudo add-apt-repository "deb https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"

```

## install docker-compose

#### Recomend got to oficial instruction
[official instruction](https://github.com/docker/compose/releases/)

#### Not actual information
```bash
curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# check integrety
## manually
sha256sum /usr/local/bin/docker-compose
## automaitc
echo '2bdab0bbf42583b4b77ee015cf908933c78f0572a7cb949a7dd8e200e6250221  /usr/local/bin/docker-compose' | sha256sum --check || sleep 180
chmod +x /usr/local/bin/docker-compose
```

## Use docker without sudo
#### Very often ubuntu terminal need to be reloaded, quick way **log out** and **log in**
```bash
# add current user to docker group
# you can use on of this two commands
# this
usermod -aG docker ${USER}
# bash will substitute user with current user (jenkins - for example), do not run it as *root*:
# usermod -aG docker jenkins

# or this
sudo gpasswd -a ${USER} docker

# test
id | grep docker # if you don't see docker
sudo su ${USER}
id | grep docker # and now see, then relogin
```

