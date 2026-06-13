# mcd-bash
A very simple bash tool for creating and cd'ing into folders you make automatically.

![Bash Demo](https://raw.githubusercontent.com/zephyrbash/mcd-bash/main/assets/demo.png)
![Fish Demo](https://raw.githubusercontent.com/zephyrbash/mcd-bash/main/assets/demo_fish.png)
![Zsh Demo](https://raw.githubusercontent.com/zephyrbash/mcd-bash/main/assets/demo_zsh.png)
![PowerShell Demo](https://raw.githubusercontent.com/zephyrbash/mcd-bash/main/assets/demo_ps.png)

# Supported Shells
- Bash
- Fish
- Zsh
- PowerShell

# Why?
Because most of the time I'm making folders I want to `cd` into them immediately, and you do too probably.

# Installing
## Method 1: Installing from zephyrbash.dev

Installing from my site is the easiest way.

```bash
curl -fsSL https://mcd.zephyrbash.dev/install.sh | bash
```

or for PowerShell:

```powershell
powershell -c "irm https://mcd.zephyrbash.dev/install.ps1 | iex"
```

## Method 2: The safest but long way

Clone the repo then run the install file directly.

```bash
git clone https://github.com/zephyrbash/mcd-bash.git
sh ./mcd-bash/install.sh # Bash
./mcd-bash/install.ps1 # PowerShell
```

# Deploying install instance

These instructions are really just for me, but in the world of open-source, nothing is stopping you from anything.

```bash
# Clone if you're doing this for the first time
git clone https://github.com/zephyrbash/mcd-bash.git
cd mcd-bash

# Using docker
git pull origin main
docker build -t mcd-bash .
docker run --restart unless-stopped -p 4040:3000 mcd-bash
```
