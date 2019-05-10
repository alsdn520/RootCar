--bbs.sql
--bbs 자료실 테이블 설계
create table bbs(
	bbs_no number(38) primary key --번호
	,bbs_name varchar2(100) not null --작성자(회원이름)
 	,bbs_title varchar2(200) not null --제목
 	,bbs_pwd varchar2(20) not null --비번
 	,bbs_cont varchar2(4000) not null --내용
 	,bbs_file varchar2(200) --이진파일경로와 파일명
 	,bbs_hit number(38) --조회수
 	,bbs_ref number(38) --글그룹번호
 	,bbs_step number(38) --원본글 0,첫번째 답변글이면 1,두번째 답변글이면 2, 즉 원본글과 답변글을 구분하는 번호값이면서 몇번째 답변글인가를 알려줌
 	,bbs_level number(38) --답변글 정렬순서
 	,bbs_date date --등록날짜
);

select * from bbs order by bbs_no desc;

delete from BBS where bbs_no=12;

alter table bbs add(bbs_id varchar2(100));



--bbs_no_seq라는 시퀀스 생성
create sequence bbs_no_seq
start with 1
increment by 1
nocache;

--생성된 시퀀스로 부터 다음번호 값 확인
select bbs_no_seq.nextval from dual;

drop sequence bbs_no_seq;

drop table bbs;
