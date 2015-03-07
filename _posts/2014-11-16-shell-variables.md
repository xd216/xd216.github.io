---
layout: post
title: shell变量的设置规则
categories: Linux
tags: shell
---

1. 变量和变量内容以一个等号“=”来连接，如下所示：

    ```bash
    myname=newbie
    ```
2. 等号两边不能直接接空格符，如下所示都是错误的：

	```bash
	myname = newbie
	myname=newbie again
	```
3. 变量名称只能是英文字母和数字，但不能以数字开头

	```bash
	2myname=newbie
	```
4. 变量内容若有空格符，可使用单引号或双引号将其括起来，但是：
  - 双引号内的特殊字符，如$等，可以保有原有的特性
  - 单引号内的特殊字符则仍为一般字符（纯文本）
5. 可用转义字符`\`将特殊字符转义为普通字符
6. 命令内嵌（即A命令需引用B命令的信息）时，可以使用两种方法：``cmd``或者`$(cmd)`
  - 引用变量内容时使用花括号，即`${var}`
7. 增加变量内容时，可用`"$var"`或者`${var}`实现累加：

	```bash
	PATH="$PATH":/home/bin
	PATH=${PATH}:/home/bin
	```
