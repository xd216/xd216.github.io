---
layout: post
title: scala 基本控制结构
categories: 编程基础
tags: scala
---

##if语句

```scala
val result = if(number > 0){
		1
		} else 0
```

##块语句

块语句是`{}`包起来的一个语句序列,其值等于最后一个表达式的值

```scala
val distance = { val dx = x - x0; val dy = y - y0; sqrt(dx * dx + dy * dy) }
```

##for语句

```scala
for( i <- 表达式)
```

*表达式1:`1 to n`(包含两个边界)
*表达式2:`0 until n`(不包含上界)

```scala
for(i <- 1 to 3; j <- 1 to 3)
//i=1时循环3次,直到i=3 共循环9次
```

```scala
for(i <- 1 to 3; j<- 1 to 3 if i != j)
//if i != j 是一个guard,if之前没有`;`
```

while语句同Java

不提供`break`,`continue`退出循环的语句

##函数

函数与方法不同,方法是操作对象,函数不是.

###无返回值

```scala
def abs(x: Double){
	if(x >= 0 ) x else -x
}
```

没有返回值的函数叫做`过程`.注意`{}`前没有等号

###有返回值

```scala
def abs(x: Double):Double = ...
```

###带名参数

```scala
def fun1(username: String, password: String, style: String = "use pwd") = 
```
style是带默认值的参数

###变长参数

```scala
def sum(args: Int*) = {}
```

*调用1: `val s = sum(1,3,5,6,7)`
*调用2: `val s = sun(1 to 5: _*)` `_*`将 `1 to 5` 变成一个参数序列

