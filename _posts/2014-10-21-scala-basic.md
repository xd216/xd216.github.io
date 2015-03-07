---
layout: post
title: scala基础
categories: 编程基础
tags: scala
---

##常量与变量

* 常量：val answer = 8*5+2 无法改变其值
* 变量：var question = "1+1=2?" 可以改变其值

**在scala中更鼓励使用val**

##数据类型

有7种：Byte,Char,Short,Int,Long,Float,Double,Boolean。

scala中的所有类型都是类，类型不区分基本类型和引用类型。

一般情况下不需要给出常量或变量的类型，scala是通过初始化表达式自动推断类型的。

必要情况下可以指定类型，在变量或函数名称**之后**。
如：val greeting:String = null

##方法的特殊风格

a+b中的+是方法名，等价于：a.+(b)

所以在scala中可以有两种风格的方法调用：

* a.方法（b）
* a 方法 b

##函数与方法

scala提供了方法，还提供函数。函数不需要从某个类调用他的静态方法。

* sqrt(2)
* pow(2,4)
* min(2,3)

需要引入数学函数包 import math._

scala没有静态方法，而是提供**单例对象**的特性。
