---
layout: post
title: Grails中使用ajax异步获取数据
categories: Web开发
tags: grails
---

##异步表单,查询数据

####页面中定义表单

```html
<g:formRemote
	 name="myForm"
	 url="[controller: 'user', action: 'ajaxGetUsers']"
         update="message"
>
  	 <g:select
		 class="form-control"
		 name="rolename"
		 from="${roles}"
		 optionKey="id"
          	 noSelection="['':'-按角色查询工号-']"
	/>
    	<input type="submit" class="btn btn-primary" value="查询" />
</g:formRemote >
```

####`UserController`中定义查询方法

```groovy
def ajaxGetUsers = {
		def role = Role.get(params.rolename.toInteger())
		def users = role?.users
		println users
		render(template:"userlists",model:[msg:users])
}
```

####上文表单所在页面内,定义一个用于更新数据的`DIV`

```html
<div id="message">
  <g:render template="userlists"/>
</div>
```

####在`/view/user`目录下创建一个template文件:`_userlists.gsp`

```html
格式可以自己定义
<g:each in="${msg}" var="m">
	${m}<br/>
</g:each>
```

##异步下拉菜单查询数据

####下拉菜单

```html
<g:select class="form-control"
	  name="username" 
	  from="${users}"
 	  optionKey="id"
          noSelection="['':'-按姓名查询信息-']"
          onchange="${remoteFunction(controller:'user',action: 'userinfo',
          update: 'userinfo',
          params: '\'id=\' + this.value')}"
/>

```

####`UserCtroller`中定义查询方法

```groovy
def userinfo(){
		println params
		def user = User.get(params.id)
		render(template:"userinfo",model:[user:user])
	}
```

####更新数据

```html
<div id="userinfo">
	<g:render template="userlists"/>
</div>
```

####定义模版文件`view/user/_userinfo.gsp`

```html
姓名:${user.name}<br/>
工号:${user.jobId}<br/>
```

