---
layout: default
title: JekyII简介
---

Jekyll的核心其实就是一个文本的转换引擎，用你最喜欢的标记语言写文档，可以是Markdown、Textile或者HTML等等，再通过`layout`将文档拼装起来，根据你设置的URL规则来展现，这些都是通过严格的配置文件来定义，最终的产出就是web页面。

基本的Jekyll结构如下：

![jekyii struture](images/jekyii.png)

简单介绍一下他们的作用：


**_config.yml**

配置文件，用来定义你想要的效果，设置之后就不用关心了。

**_includes**

可以用来存放一些小的可复用的模块，方便通过`{ % include file.ext %}`灵活的调用。这条命令会调用_includes/file.ext文件。

**_layouts**

这是模板文件存放的位置。

**_posts**

你的动态内容，一般来说就是你的博客正文存放的文件夹。他的命名有严格的规定，必须是`2012-02-22-artical-title.MARKUP`这样的形式，MARKUP是你所使用标记语言的文件后缀名，根据_config.yml中设定的链接规则，可以根据你的文件名灵活调整，文章的日期和标记语言后缀与文章的标题的独立的。

**_site**

这个是Jekyll生成的最终的文档，不用去关心。最好把他放在你的`.gitignore`文件中忽略它。

**其他文件夹**

你可以创建任何的文件夹，在根目录下面也可以创建任何文件，假设你创建了`project`文件夹，下面有一个`github-pages.md`的文件，那么你就可以通过`yoursite.com/project/github-pages`访问的到，如果你是使用一级域名的话。文件后缀可以是`.html`或者`markdown`或者`textile`。
