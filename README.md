.vim
====
My vim configs

For Windows GVim configureation, create a softlink to .vim as vimfiles

Installation:
```sh
git submodule init
git submodule update --remote --merge
```

Add a new submodule:
```sh
git submodule add https://github.com/xxxx/xxxxx.git bundle/xxxxx
```
Remove a new submodule:

```sh
git rm bundle/xxxxx
git commit -a
```
Maintainence:
```sh
git submodule foreach git reset --hard
git submodule foreach git pull
```
