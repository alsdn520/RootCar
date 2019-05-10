--예약

create table car_travel(
 car_no number(38) primary key           --시쿼스 번호값 
,car_member_name varchar2(50) not null   --빌린회원 이름
,car_member_email varchar2(50) not null  --빌린회원 이메일
,car_member_phone varchar2(50) not null  --빌린회원 번호

,car_name varchar2(50) not null          --차 이름
,car_location varchar2(50) not null      --차 위치 
,car_Start varchar2(50) not null         --차 빌린날
,car_End varchar2(50) not null           --차 반납
,rent_price varchar2(100) not null       --차 대여 요금가격
,car_date date --예약이게 예약 등록된 데이터
,car_common varchar2(20) --걍 공통적인 값 

);
select * from car_travel;

drop table car_travel;

create sequence car_no_seq
start with 1
increment by 1
nocache;

drop sequence car_no_seq;