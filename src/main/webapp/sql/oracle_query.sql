
/* rcp */
create table Rcp(
rcpnum INT PRIMARY KEY,
title varchar2(50),
foodname varchar2(100),
subtitle varchar2(500),
cookingtime varchar2(50),
memnum int,
reg_date date,
thumbnail varchar2(50),
hashtag varchar2(1000),
category varchar2(1000),
readcount int
);


create table ingredient (
rcpNum INT,
ingredient varchar2(50),
quantity varchar2(50)
);

create table imgFile(
rcpNum int not null,
step int,
fileSize int,
fileName varchar(30),
content varchar(100)
);


create table RcpContent(
rcpNum int not null,
step int,
fileName varchar2(100),
content varchar2(1000)
);

create table category(
cateNum number(2) primary key,
division varchar2(40),
cateName varchar2(40)
);

create table division(
division_num number primary key,
division_name varchar2(40)
);

CREATE TABLE likes(
memnum int,
mypick int
);


/* member */

create table brand_member(
  brand varchar(60) not null,
  name varchar(30) not null,   
  tel varchar(40) not null,
  email varchar(60) not null,   
  selfIntroduction varchar(200),
  inquiry varchar(200) ,
  id varchar(50) primary key
);
select * from member;
ㅇ
create table member(
  memNum int UNIQUE,
  email varchar(60) primary key,   
  name varchar(10) not null,   
  passwd varchar(12) not null,
  profile varchar(50),
  selfIntroduction varchar(200)
);

create table follow(
  memNum varchar(50),
  followNum varchar(50)
);

create table scrap(
  memnum varchar(50),
  scrapnum varchar(50)
);

/*shopping*/

create table sale(
rcpNum int not null primary key,
thumbnail varchar2(50) not null,
productname varchar(128) not null,
price number not null,
stock int,
sales int
);

create table cart(
cartnum int not null primary key,
memNum int not null,
thumbnail varchar2(50),
productname varchar(128),
qty int,
price number 
);

create table order_info(
ordernum number not null primary key,
memNum int not null,
orderdate varchar(25) not null,
amount number,
memName varchar(10),
Recipient varchar(30),
address varchar(128) not null,
zipcode varchar(20) not null,
memo varchar(100),
paid varchar(15)
);

create table order_product(
productnum int not null primary key,
ordernum number not null,
productname varchar(128),
qty int,
price number 
);

create table mem_address(
addressnum int not null primary key,
addrName varchar(50),
memNum int not null,
memName varchar(10),
address varchar(500),
zipcode int
);

create table jjim(
jjimnum int not null primary key,
memNum int not null,
productname varchar(128),
price number,
regist_date date
);

insert into RCP values(1,'������ �κκ�ħ', '�κο� ������� ��ħ', '�κκ�ħ','5��',  1, sysdate,'1.png', '�κ�#���#�Ŀ���#', '������#�κκ�ħ#���ܿ丮#���ܹ���#�����' );
insert into sale values(1,'�������� �κ�����', 5000, 10,0);
commit

SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

--동진
create table nutrient(
nutrient_num number primary key,
foodgroup varchar2(50),
food varchar2(100),
energy number,  --칼로리
protein number, --단백질
fat number, --지질
carb number, --탄수화물
sugar number, --당분
cal number,  --칼슘
na number, --나트륨
chole number --콜레스테롤
);