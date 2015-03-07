---
layout: post
title: Grails中的REST
categories: Web开发
tags: grails
---

###简介

REST本身并不是一门技术,而是一种网络架构.它使用XML或JSON作为通信媒介,使用四种HTTP方法:`GET`,`POST`,`PUT`,`DETELE`

每一种HTTP方法对应一个action类型:
    * GET: 获取数据
    * POST: 创造数据
    * PUT: 更新数据
    * DETELE: 删除数据
   
###创建REST风格的Domain

```groovy
import grails.rest.*
@Resource(uri='/books')
class Book {

    String title

    static constraints = {
        title blank:false
    }
}
```

可以在`BootStrap.groovy`中添加一些测试数据:  

```groovy
def init = { servletContext ->
        new Book(title:"The Stand").save()
        new Book(title:"The Shining").save()
    }
```

###链接REST风格的资源

```html
<g:link resource="${book}">My link</g:link>
```

DELETE比较特殊,这样:

```html
    <form action="/book/2" method="post">
 	  <input type="hidden" name="_method" value="DELETE"/>
    </form>
```

###从不同的namespace访问REST风格的资源

修改URLmapping

```groovy
"/books/v1"(resources:"book", namespace:'v1')
"/books/v2"(resources:"book", namespace:'v2')
```

可以映射到不同包下面的多个同名Controller

```groovy
package myapp.v1
class BookController {
    static namespace = 'v1'
}

package myapp.v2

class BookController {
    static namespace = 'v2'
}
```

###创建REST风格的Controller

* 创建controller类
* 添加import和注解
    ```groovy
    import grails.transaction.*
    import static org.springframework.http.HttpStatus.*
    import static org.springframework.http.HttpMethod.*
    @Transactional(readOnly = true)
    class BookController {
        …
    }
    ```
*  每一个HTTP方法对应一个URL,同时对应一个Controller中的action方法

GET     /books  	index

GET	    /books/${id}	show

GET	    /books/create	  create

GET	    /books/${id}/edit	edit

POST	/books	    save

PUT	    /books/${id}	update

DELETE	/books/${id}	delete

要一一实现这些action方法,用于处理HTTP请求

用到`respond`方法,参考[http://grails.org/doc/latest/ref/Controllers/respond.html]

参考[http://grails.org/doc/latest/guide/webServices.html#restControllersStepByStep]

