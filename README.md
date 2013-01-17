Dotfiles
========

These are my dotfiles. I've put them on github for easy distribution on different (Ubuntu) machines.

The files should be cloned to your homedirectory (~/dotfiles). The included setup script (_initialize.sh) will copy existing dotfiles to a backup directory (~/backup/dotfiles_org), and create symlinks to the corresponding files in ~/dotfiles. You can (re)run _initialize.sh anytime (for instance, after you've added an extra dotfile to ~/dotfiles yourself), as it will skip already created symlinks.

Installation
------------

``` bash
git clone --recursive git://github.com/geenid/dotfiles ~/dotfiles
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
