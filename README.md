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
# Git settings
GIT_NAME="Your name"
GIT_EMAIL="username@domain.com"
GIT_COMMITTER_NAME="$GIT_NAME"
GIT_COMMITTER_EMAIL="$GIT_EMAIL"
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
```

Now your all setup!

`make help` Lets you know all the available commands.
