--상품등록

create table car_pr(
pr_no number(38) primary key,
pr_name varchar2(50),
pr_location varchar2(300),
pr_car varchar2(50),
pr_price number(38),
pr_cont varchar2(2000),
pr_date date,
pr_file varchar2(200),
pr_car_Activation varchar2(20)
);
ALTER TABLE car_pr ADD(pr_car_Activation varchar2(20));
ALTER TABLE car_pr ADD(pr_car_Activation varchar2(20));



select * from car_pr order by pr_no desc;

drop table car_pr;

create sequence pr_no_seq
start with 1
increment by 1
nocache;

drop sequence pr_no_seq;
select pr_no_seq.nextval from dual;