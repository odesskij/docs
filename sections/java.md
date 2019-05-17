## repository

```bash
# old
add-apt-repository ppa:webupd8team/java
# new
sudo add-apt-repository ppa:linuxuprising/java
apt-get update
```
## remove OpenJDK

```bash
sudo apt purge openjdk*
```

## install

```bash
# old
apt-get install -y oracle-java8-installer
# new
apt-get install -y oracle-java11-installer
java -version
```

## if there is no *add-apt-repository* [add it](./common.md)

```bash
apt-get update && apt-get install -qqy python-software-properties software-properties-common
```

> Tested on ubuntu 14.04
