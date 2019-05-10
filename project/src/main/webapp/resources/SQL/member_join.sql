--member_join

create table member_join(
	mem_no number(38) 
	,mem_id varchar2(20) primary key --회원아이디
	,mem_pwd varchar2(20) not null  --회원비번
	,mem_pwd2 varchar2(30) not null --회원비번확인
	,mem_name varchar2(30) not null --회원이름
	,mem_age varchar2(14) not null  --회원나이
	,mem_addr varchar2(150) not null --회원주소
	,mem_email varchar2(40)         --회원이메일
	,mem_phone varchar2(30)         --회원번호1
	,mem_phone02 varchar2(10)       --회원번호2
	,mem_phone03 varchar2(10)       --회원번호3
	,mem_edit number(38) default 0  --회원 정부 수정수 
	,mem_hit number(38) default 0   --회원 로그인 방문수 
	,mem_date date 					--회원가입날짜
	,delete_reason varchar2(500)    --이거 계정 블랙걸때 사유 적을라고
	,member_Activation varchar2(20) --계정 활성화 상태 즉 블랙을 걸거나탈퇴 시킬때 사용할라고

);

ALTER TABLE member_join ADD(delete_reason varchar2(1000));     -- 이거 계정 블랙걸때 사유 적을라고
ALTER TABLE member_join ADD(member_Activation varchar2(20));   --계정 활성화 상태 즉 블랙을 걸거나탈퇴 시킬때 사용할라고
ALTER TABLE member_join ADD(mem_no number(38));
ALTER TABLE member_join ADD(member_edit number(20));
ALTER TABLE member_join ADD(mem_backupID varchar2(100));
ALTER TABLE member_join DROP COLUMN mem_backupID;

select * from MEMBER_JOIN;

select count(mem_id) from member_join where mem_id like '%%'
and member_Activation ='YES';

drop table member_join;


--board_no_seq 시퀀스 생성
create sequence mem_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache;

drop sequence mem_no_seq;

--생성된 시퀀스로 부터 번호값 확인
select mem_no_seq.nextval from dual;

select * from member_join order by mem_id asc;