---
layout: default
title: ubuntu 14.10 安装搜狗输入法的问题
---

1. `fcitx`依赖关系不满足
> 这是因为`ubuntu`自带的输入法框架为`ibus`，因此需要安装`fcitx`框架：
> - `sudo apt-add-reposity ppa:fcitx-team/nightly`
> - `sudo apt-get update`
> - `sudo apt-get install fcitx`（或者在“软件中心”搜索`fcitx`，安装即可）

2. 搜狗面板程序加载失败
> 此时即使按照其其实重启输入法，可能依然没有效果。
> 原因是`sogou-qimpanel`取代了`fcitx-qimpanel`,需要启动`sogou-qimpanel`
> 为了方便，可以将`sogou-qimpanel`加入自启动项，执行以下命令：
> `sudo ln -s /usr/bin/sogou-qimpanel /etc/init.d/sogou-qimpanel`
