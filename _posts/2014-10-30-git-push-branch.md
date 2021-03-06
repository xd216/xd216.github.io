---
layout: post
title: git分支协作
categories: 其他
tags: git
---

###创建本地分支

用户A在本地基于master分支检出dev分支：

```console
$ git checkout -b dev 
```

然后将该dev分支推送到远程仓库：

```console
$ git push origin dev
```

这时远程仓库就有了两个分支。

###克隆并检出dev分支

用户B首先克隆远程仓库：

```console
$ git clone git@gitserver:/path/to/yourProject.git
```

此时用户B本地只有master分支，因为远程仓库的当前分支（HEAD指向）为master分支：

```console
$ git branch
* master
```

但是`git clone`操作实际上已经将远程仓库的所有分支的相关信息取到本地，可用以下命令查看：

```console
$ git branch -r
 origin/HEAD -> origin/master
 origin/dev
 origin/master
```

可以看出，远程仓库有两个分支，且当前活动分支为master分支。此时，用户B可以检出该dev分支：

```console
$ git checkout -b dev origin/dev
```

也可以用`--track`选项简化该命令：

```console
$ git checkout --track origin/dev
```

这样的话，新检出的本地分支将与远程分支同名。

###注意

* 从远程分支检出的本地分支，自动成为*跟踪分支*
* 将远程仓库并不存在的本地分支推送到远程，并不会自动建立*跟踪*关系（上述的用户A，其dev分支和远程的dev分支没有*跟踪关系*）
* `git branch --set-upstream <local_branch> origin/<branch>`用于建立本地分支和远程分支的*跟踪关系*
* 跟踪分支是一种和某个远程分支有**直接联系**的本地分支。在跟踪分支里输入`git push`，Git 会自行推断应该向哪个服务器的哪个分支推送数据。同样，在这些分支里运行`git pull`会获取所有远程索引，并把它们的数据都合并到本地分支中来。
