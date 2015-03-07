---
layout: post
title: bash数组的使用
categories: Linux
tags: bash
---

利用`ls`命令的输出构建数组时，有两种写法：

1. `array=$(ls)`
2. `array=($(ls))`

两者都可以用`for`循环迭代处理，对应的循环体如下所示：

1. `for filename in $array`
2. `for filename in ${array[@]}`

因为前者的`array`为一个整体（一般是空格分隔），而后者的`array`是一个数组。换句话说，后者可以用索引值取出单独的某个元素，而前者不可以。

> 注意：对前者的`array`进行loop时，其元素分隔符由IFS指定，默认为`tab`,`space`和`newline`.
