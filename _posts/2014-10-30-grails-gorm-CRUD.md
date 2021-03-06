---
layout: post
title: Grails-GORM-CRUD
categories: Web开发
tags: grails
---

##save|update


默认的每次save操作并不会立即被推到数据库,而是在下次`session.flush()`发生时被推到数据库.

`session.flush()`执行时,清除HibernateSession缓存,使数据库与hibernate缓存同步,保证数据一致性.并向DB发送sql语句.

```groovy
def p = Person.get(1)
p.save()
```

每次save一个对象时,grails自动验证domain中的规则,如果验证失败,save操作失败,不会将对象持久化到数据库.默认返回`null`,可以进行异常控制如下:

```groovy
def p = Person.get(1)
try {
    p.save(failOnError: true)
}
catch (ValidationException e) {
    // deal with exception
}
```

##delete

```groovy
def p = Person.get(1)
p.delete()
```

同save操作一样,delete操作也是使用`write-behind`事务策略,如果想每次执行delete/save操作时,立即刷新缓存,应该采取:`p.delete(flush:true)`.

使用`flush:true`的好处是,当此次删除操作发生异常时,可以控制此异常.

常见的情况是:违反数据库的约束进行删除操作

```groovy
try {
    p.delete(flush: true)
}
catch (org.springframework.dao.DataIntegrityViolationException e) 
{
	flash.message = "Could not delete person"
   	 redirect(action: "show", id: p.id)
}
```

批量删除:

```groovy
Customer.executeUpdate("delete Customer c where c.name = :oldName",
                       [oldName: "Fred"])
```

##级联更新和删除

####不论一对一,一对多,多对多,定义`belongsTo`就会使更新操作从拥有者级联到从属者.删除操作:多/一对一,一对多是级联的.

不定义`belongsTo`的话,不会自动级联,需要手动操作

示例:一个
