---
layout: post
title: Ubuntu中安装Ruby
categories: Linux
tags: Ruby
---

##1.安装ruby-install工具
```console
$ tar -xzvf ruby-install-0.5.0.tar.gz
$ cd ruby-install-0.5.0/
$ sudo make install
```

##2.安装Ruby的稳定版本
```console
$ ruby-install ruby
```

##3.配置环境变量PATH
上述步骤默认将ruby安装在了用户主目录下，需要将ruby安装目录下的bin加入PATh环境变量。修改/etc/profile文件即可，在该文件末尾加入以下代码：

```bash
export PATH=$RUBY_INSTALL/bin:$PATH
```
