Dotfiles
========

These are my dotfiles. I've put them on github for easy distribution on different (Ubuntu) machines.

How does it work?
-----------------

The idea is simple. Configuration files (like .vimrc and .bashrc) that live in my homedirectory are put into a separate directory ~/dotfiles. The original files are backed up and replaced by symlinks pointing to the ~/dotfiles directory. This way the complete dotfiles directory can easily be cloned to other machines.

The included setup script (_initialize.sh) will copy the existing dotfiles to a backup directory (~/backup/dotfiles_org), and create symlinks to the corresponding files in ~/dotfiles. You can (re)run _initialize.sh anytime (for instance, after you've added an extra dotfile to ~/dotfiles yourself), as it will skip already created symlinks.

Prerequisites
-------------

I like the (light) Solarized color theme, so I use that one in my dotfiles. To get most out if this theme, you might need to adjust some terminal settings first:


* PuTTY: [putty-colors-solarized](https://github.com/altercation/solarized/tree/master/putty-colors-solarized)
* Ubuntu: [setup.ubuntu.solarize.sh](https://gist.github.com/1280177)

Installation
------------

``` bash
git clone --recursive git://github.com/nanu2/dotfiles ~/dotfiles
cd ~/dotfiles
./_initialize.sh
```

Note that I installed vim plugins as git submodules, that's why you need the --recursive option. When you clone my dotfiles repo, all vim plugins are recursively cloned from their original contributors.

Git and submodules
------------------

So, how did I add the vim plugins as git submodules? As an example, this is how I've added the supertab plugin:

``` bash
git submodule add https://github.com/ervandew/supertab.git vim/bundle/supertab
```

All vim plugins are installed as submodule and can be found in the vim/bundle directory. In order to update the submodules at a later time, you simply type:

``` bash
git submodule foreach git pull origin master
```
