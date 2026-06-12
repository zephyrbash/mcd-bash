# mcd-bash
A very simple bash tool for creating and cd'ing into folders you make automatically.

![Demo](https://raw.githubusercontent.com/zephyrbash/mcd-bash/main/demo.png)

# Why?
Because most of the time I'm making folders I want to `cd` into them immediately, and you do too probably.

# Installing
## Method 1: Installing from zephyrbash.dev

Installing from my site is the easiest way.

```bash
curl -fsSL https://mcd.zephyrbash.dev/install.sh | bash
```

## Method 2: The safest but long way

Clone the repo then run the install file directly.

```bash
git clone https://github.com/zephyrbash/mcd-bash.git
sh ./mcd-bash/install.sh
```

# Deploying install instance

These instructions are really just for me, but in the world of open-source, nothing is stopping you from anything.

```bash
# Clone if you're doing this for the first time
git clone https://github.com/zephyrbash/mcd-bash.git
cd mcd-bash

# Using docker
docker build -t mcd-bash .
docker run --restart unless-stopped -p 4040:3000 mcd-bash
```
