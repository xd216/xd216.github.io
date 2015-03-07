---
layout: post
title: 搭建git服务器
categories: 其他
tags: git
---

###添加用户`git`

```console
$ sudo adduser git
```

###收集登录证书（`su`之后的操作均以git用户的身份进行）

```console
$ su git
$ cd
$ mkdir .ssh
```

***

接下来，把开发者的`SSH`公钥添加到这个用户的`authorized_keys`文件中。假设你通过电邮收到了几个公钥并存到了临时文件里。重复一下，公钥大致看起来是这个样子：

```console
$ cat /tmp/id_rsa.john.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCB007n/ww+ouN4gSLKssMxXnBOvf9LGt4L
ojG6rs6hPB09j9R/T17/x4lhJA0F3FR1rP6kYBRsWj2aThGw6HXLm9/5zytK6Ztg3RPKK+4k
Yjh6541NYsnEAZuXz0jTTyAUfrtU3Z5E003C4oxOj6H0rfIF1kKI9MAQLMdpGW1GYEIgS9Ez
Sdfd8AcCIicTDWbqLAcU4UpkaX8KyGlLwsNuuGztobF8m72ALC/nLF6JLtPofwFBlgc+myiv
O7TCUSBdLQlgMVOFq1I2uPWQOkOWQAHukEOmfjy2jctxSDBQ220ymjaNsHT4kgtZg2AYYgPq
dAv8JggJICUvax2T9va5 gsg-keypair
```
只要把它们逐个追加到`authorized_keys`文件尾部即可：

```console
$ cat /tmp/id_rsa.john.pub >> ~/.ssh/authorized_keys
$ cat /tmp/id_rsa.josie.pub >> ~/.ssh/authorized_keys
$ cat /tmp/id_rsa.jessica.pub >> ~/.ssh/authorized_keys
```

###创建裸仓库

用`--bare`选项运行`git init`来建立一个裸仓库（在git用户主目录下建立目录亦可），这会初始化一个不包含工作目录的仓库：

```console
$ cd /opt/git
$ mkdir project.git
$ cd project.git
$ git --bare init
```

###第一次推送

这时，Join，Josie 或者 Jessica 就可以把它加为远程仓库，推送一个分支，从而把第一个版本的项目文件上传到仓库里了。值得注意的是，每次添加一个新项目都需要通过 shell 登入主机并创建一个裸仓库目录。我们不妨以 gitserver 作为 git 用户及项目仓库所在的主机名。如果在网络内部运行该主机，并在 DNS 中设定 gitserver 指向该主机，那么以下这些命令都是可用的：

```console
# 在 John 的电脑上
$ cd myproject
$ git init
$ git add .
$ git commit -m 'initial commit'
$ git remote add origin git@gitserver:/opt/git/project.git
$ git push origin master
```

###其他人进行克隆和推送

```console
$ git clone git@gitserver:/opt/git/project.git
$ cd project
$ vim README
$ git commit -am 'fix for the README file'
$ git push origin master
```

###额外的防范措施

可以用`Git`自带的`git-shell`工具限制`git`用户的活动范围。只要把它设为`git`用户登入的`shell`，那么该用户就无法使用普通的`bash`或者`csh`什么的`shell`程序。编辑`/etc/passwd`文件：

```console
$ sudo vim /etc/passwd
```

在文件末尾，你应该能找到类似这样的行：

```console
git:x:1000:1000::/home/git:/bin/sh
```

把`bin/sh`改为`/usr/bin/git-shell`（或者用`which git-shell`查看它的实际安装路径）。该行修改后的样子如下：

```console
git:x:1000:1000::/home/git:/usr/bin/git-shell
```

现在`git`用户只能用 SSH 连接来推送和获取 Git 仓库，而不能直接使用主机 shell。尝试普通 SSH 登录的话，会看到下面这样的拒绝信息：

```console
$ ssh git@gitserver
fatal: What do you think I am? A shell?
Connection to gitserver closed.
```
