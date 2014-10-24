---
layout: default
title: 利用getopt函数对命令行参数进行解析
---

###函数原型：
{% prism c %}
int getopt (int argc, char *const *argv, const char *options)
{% endprism %}

###外部变量：
{% prism c %}
extern char *optarg;
extern int optind, opterr, optopt;
{% endprism %}

###参数含义：
* 命令行参数中以`-`开头的参数称为选项（option）
* 参数`options`指定了合法的命令行选项列表（单字母）
* 如果某个选项字母用分号`:`结尾，则表示该选项要求带参数（双冒号`::`则表示参数可选）
* 带参数选项的参数可以紧跟选项字母，亦可以用空格隔开
* 选项参数可选时，该参数必须紧跟选项字母出现，否则`optarg`将被设置为0（即视为无参）
* 选项对应的参数将存储在外部变量`optarg`中（直接指向`argv`中的相应位置处）
* 如果`getopt`遇到非法选项（不在`options`中）或者本应带参数的选项未带参数，`getopt`返回`？`，并将`optopt`设置为该选项字母（若`options`的首字母为`:`，此时将返回`:`而不是`？` --这可以用于区分前述两种出错情况），此外`getopt`还将向`stderr`打印出错信息（将`opterr`设置为`0`将阻止输出此错误信息）
* `optind`为待处理的下一个选项的索引值，其初始值为1
* 为了处理任意顺序的选项（调用程序时，各选项极有可能乱序给出），`getopt`将在扫描命令行选项时，重新排列选项顺序，使得非选项（non-options）参数排在最后
* `getopt`的返回值为下一个待处理的选项字母，如果没有更多的选项字母可供处理，则返回`-1`（此时可能有不止一个非选项参数待处理，最好检查`optind`和`argc`的值以确定其数量）

###参考：
- http://www.gnu.org/software/libc/manual/html_node/Using-Getopt.html#Using-Getopt
- http://man7.org/linux/man-pages/man3/getopt.3.html
