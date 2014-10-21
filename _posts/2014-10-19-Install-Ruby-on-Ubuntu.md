---
layout: default
title: Ubuntu中安装Ruby
---

ubuntu中安装Ruby的步骤（仅需两步）
========================

1.安装ruby-install工具

<pre><code class="language-bash">
wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
tar -xzvf ruby-install-0.5.0.tar.gz
cd ruby-install-0.5.0/
sudo make install
</code></pre>

2.安装Ruby的稳定版本

<pre><code class="language-bash">
$ ruby-install ruby
</code></pre>


