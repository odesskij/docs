## repository

```bash
add-apt-repository ppa:webupd8team/java
apt-get update
```

## install

```bash
apt-get install -y oracle-java8-installer
java -version
```

## if there is no *add-apt-repository*

```bash
apt-get update && apt-get install -qqy python-software-properties software-properties-common
```

> Tested on ubuntu 14.04