---
layout: default
title: hibernate ORM 关联关系映射-基础
---

对于良好的数据库设计,数据表不是单独存在的,彼此之间总会存在一些关系,使用ORM的关联关系映射,可以将逻辑上实体与实体之间的关系自动映射为数据库中表之间的关系.

##ManyToOne和OneToOne

`@ManyToOne`: 若干个实体都可以指向目标实体. **不同于OneToMany之处在于所站的角度不同,映射成的数据库表结构是相同的**

`@OneToOne`: 只有一个实体可以指向目标实体.

单向:只能从拥有者指向被拥有者.

在数据库中是以外键的形式被映射的.

owning中有一个引用owned主键的外键.本例中是:Person中有一个名为`Address_Id`的外键.

**Owning side**

```java
@Entity 
 public class Person implements Serializable { 
    private static final long serialVersionUID = 1L; 
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private Long id; 
    @OneToOne 
    private Address address; 

 // 　 Getters & Setters 
 }
```

**Owned side(单向)**

```java
@Entity 
 public class Address implements Serializable { 
    private static final long serialVersionUID = 1L; 
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private Long id; 

 // Gettes& Setters 
 }
```

**Owned side(双向)**

```java
@Entity 
 public class Address implements Serializable { 
    private static final long serialVersionUID = 1L; 
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private Long id; 
   
    @OneToOne(mappedBy = "address") 
    private Person person; 
 
    // Gettes& Setters 

 }
```

##OneToMany

一对多关联关系,在数据库中默认以中间表的方式映射,也可以使用外键的方式.

中间表的名称规则: owning+下划线+owned

![](/images/o2m.jpg)

##ManyToMany

多对多关系在数据库中只能通过中间表方式映射.

###单向

**owning side**

```java
@Entity 
 public class Teacher implements Serializable { 
   
    private static final long serialVersionUID = 1L; 
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private Long id; 
    
    @ManyToMany 
    private List<Student> students; 
    // Getters  and  Setters 
 }
```

**owned side**

```java
@Entity 
 public class Student implements Serializable { 
    private static final long serialVersionUID = 1L; 
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private Long id; 
    
   //Getters  and  Setters 
 }
```

###双向

**owned side**

```java
@Entity 
 public class Student implements Serializable { 
    private static final long serialVersionUID = 1L; 
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private Long id; 
   
    @ManyToMany(mappedBy = "students") 
    private List<Teacher> teachers; 
    //Getters  and  Setters 
 }
```

![](/images/m2m.jpg)

