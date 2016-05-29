## update and upgrade

```bash
apt-get update && apt-get dist-upgrade
```

## install

```bash
apt-get install -y software-properties-common pwgen htop mc vim git curl libcurl4-openssl-dev build-essential
```

## .bashrc

```bash
cat ./.bashrc > ~/.bashrc
cat ./.bashrc > /etc/skel/.bashrc
```

## locales

````bash
echo "ru_UA.UTF-8 UTF-8" > /var/lib/locales/supported.d/local
echo "en_US.UTF-8 UTF-8" > /var/lib/locales/supported.d/en
echo -e "LANG=\"ru_UA.UTF-8\"\nLANGUAGE=\"ru_UA:ru\"\nLC_ALL=\"ru_UA.UTF-8\"" > /etc/default/locale
rm -rfv /usr/lib/locale/*
locale-gen
#reboot
````

> Tested on ubuntu 14.04