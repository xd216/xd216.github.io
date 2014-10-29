---
layout: default
title: 使用Grails layout创建页面模版,统一页面风格
---

###创建模版

```html
<html>
    <head>
        <title><g:layoutTitle default="An example decorator" /></title>
        <g:layoutHead />
    </head>
    <body onload="${pageProperty(name:'body.onload')}">
        <div class="menu"><!--my common menu goes here--></menu>
            <div class="body">
                <g:layoutBody />
            </div>
        </div>
    </body>
</html>
```

#有三个关键元素#:`layoutTitle`,`layoutHead`,`layoutBody`,分别输出目标页的title,head标签中的内容,body标签的内容.

###使用模版

####单页面使用模版

```html
<html>
    <head>
        <title>An Example Page</title>
        <meta name="layout" content="main" />
    </head>
    <body>This is my content!</body>
</html>
```

####整个Controller涉及的页面统一使用模版

```groovy
class BookController {
    static layout = 'custom/customer'
    def list() { … }
}
```

此代码表示BookController下的gsp页面将使用`grails-app/views/layouts/custom/customer.gsp` 作为模版.

####按`约定优于配置原则`使用模版

```groovy
class BookController{
	def list(){...}
}
```

可以创建`grails-app/views/layouts/book.gsp`,酱紫BookController默认会使用此文件作为模版.



