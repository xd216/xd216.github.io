---
layout: post
title: dup2实现“剪切”文件描述符
categories: Linux
tags: dup2
---

###函数原型

```c
int dup2(int filedes, int filedes2);
```

将现存文件描述符`filedes`复制到指定的文件描述符`filedes2`上

###实现剪切

利用上述函数将`filedes`复制到`filedes2`之后，可以调用close()
