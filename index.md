---
layout: page
title: 西电216实验室
---
{% include JB/setup %}

##Blog Posts

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date: "%F" }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
