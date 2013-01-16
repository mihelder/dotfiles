Dotfiles
========

These are my dotfiles. I've put them on github for easy distribution on different (Ubuntu) machines.

The files should be cloned to your homedirectory (~/dotfiles). The included setup script (_initialize.sh) will copy existing dotfiles to a backup directory (~/dotfiles_org), and create symlinks to the corresponding files in ~/dotfiles.

Installation
------------

``` bash
git clone git://github.com/moriander/dotfiles ~/dotfiles
cd ~/dotfiles
./_initialize.sh
```

