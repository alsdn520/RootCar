--댓글 테이블
create table reply (
	reply_no number(38) primary key --댓글 번호
	,bbs_no number(38) not null --게시글 번호
	,reply_name varchar(50) --댓글 작성자
	--,comment_parent number(38) --부모글
	,reply_cont varchar2(1000) not null --댓글 내용
	,reply_date date --댓글 작성일
);

drop table reply;

select * from reply;

select * from reply where bbs_no=13;

--외래키 설정
alter table reply add constraint fk_comment foreign key(bbs_no) references bbs(bbs_no) on delete cascade;

alter table reply drop constraint fk_comment;

--시퀀스 생성
create sequence reply_no_seq
start with 1
increment by 1
nocache;

--시퀀스 번호값 확인
select reply_no_seq.nextval from dual;