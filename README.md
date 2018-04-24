# ~/.sysconfig

Quickly get setup on a new system with sysconfig. 

## Get it

``` shell
git clone https://github.com/stephenway/sysconfig.git .sysconfig
cd .sysconfig
make
```

## Customize

If you haven't already, create a `~/.localrc` file in your home directory, it will get sourced in automatically once it's created. This file lets you set personal settings in bash or git for whatever you need. Initially you will want to define who you are in git so your commits will have an author. Just copy this in.

```shell
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Mathias Bynens"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="mathias@mailinator.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

Now your all setup!

`make help` Lets you know all the available commands.
