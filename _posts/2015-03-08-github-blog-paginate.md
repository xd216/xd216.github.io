---
layout: post
title: github blog 分页
categories: Web开发
tags: github
---

###1.修改`_config.yml`

添加分页设置

```yml
paginate: 18
paginate_path: "blog/page:num"
```
如果此文件中包含permalink设置,将其去掉.

###2.修改`index.md`文件

将md后缀名修改为html,分页只支持HTML格式

修改内容
```html
<ul class="posts">
  {% for post in paginator.posts %}
    <li><span>{{ post.date | date: "%F" }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

{% if paginator.total_pages > 1 %}
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="{{ paginator.previous_page_path | prepend: site.baseurl | replace: '//', '/' }}">&laquo; 上一页</a>
  {% else %}
    <span>&laquo; 上一页</span>
  {% endif %}

  {% for page in (1..paginator.total_pages) %}
    {% if page == paginator.page %}
      <em>{{ page }}</em>
    {% elsif page == 1 %}
      <a href="{{ '/index.html' | prepend: site.baseurl | replace: '//', '/' }}">{{ page }}</a>
    {% else %}
      <a href="{{ site.paginate_path | prepend: site.baseurl | replace: '//', '/' | replace: ':num', page }}">{{ page }}</a>
    {% endif %}
  {% endfor %}

  {% if paginator.next_page %}
    <a href="{{ paginator.next_page_path | prepend: site.baseurl | replace: '//', '/' }}">下一页 &raquo;</a>
  {% else %}
    <span>下一页 &raquo;</span>
  {% endif %}
</div>
{% endif %}
<br/>

```
