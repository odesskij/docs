## install nodejs12.x

```bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## upgrade

```bash
npm install -g n
n latest
```

> Tested on Mint 19 Tara, Tina

Or via [_nvm_](https://github.com/creationix/nvm#install-script)

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.1/install.sh | bash
# see the version
nvm ls-remote | tail
nvm install $(nvm ls-remote | tail -n 1)
```
