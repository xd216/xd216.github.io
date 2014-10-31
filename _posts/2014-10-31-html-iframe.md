---
layout: default
title: HTML iframe 标签的 name 属性
---

###定义和用法

* name 属性规定 iframe 的名称。
* 用于在 JavaScript 中引用元素，或者作为**链接的目标**

###语法

```html
<iframe name="value">
```

###实例

**作为链接目标**的 iframe：

```html
<iframe src="demo_iframe.htm" name="iframe_a">
<p>Your browser does not support iframes.</p>
</iframe>
<a href="http://www.w3school.com.cn" target="iframe_a">W3School.com.cn</a>
```


