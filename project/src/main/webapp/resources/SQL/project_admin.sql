
--project_admin

create table project_admin(
 admin_id varchar2(100) primary key--관리자아이디
,admin_pwd varchar2(200) not null--관리자 비번
,admin_name varchar2(20) not null--관리자이름
,admin_date date--등록날짜
);
select * from project_admin;

drop table project_admin;

--게시판에 쓸 컬럼


create table admin_gong(
admin_no number(38) primary key,
admin_id varchar2(100) not null--관리자아이디
,admin_pwd varchar2(200) not null--관리자 비번
,admin_name varchar2(20) not null--관리자이름
,admin_date date--등록날짜
,admin_title varchar2(40) not null
,admin_cont varchar2(4000) not null
);

select * from ADMIN_GONG;

create sequence admin_no_seq
start with 1
increment by 1
nocache;

drop table admin_gong;
drop sequence admin_no_seq;
