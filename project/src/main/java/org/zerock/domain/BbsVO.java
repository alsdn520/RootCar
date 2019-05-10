package org.zerock.domain;

public class BbsVO {//자료실 데이터 저장빈
/* bbs 테이블 컬럼명과 BbsVO.java의 변수명을 같게 한다. */
	
	private int bbs_no; //게시물번호
	private String bbs_name; //작성자(회원이름)
	private String bbs_id; //작성자아이디
	private String bbs_title; //제목
	private String bbs_pwd; //비번
	private String bbs_cont; //내용
	private String bbs_file; //이진첨부파일
	private int bbs_hit; //조회수
	private int bbs_ref; //원본글과 답변글을 묶어주는 그룹번호
	private int bbs_step; //원본글이면 0,첫번째 답변글 이면 1,두번째 답변글이면 2, 즉 원본글과 답변글을 구분하는 번호값
	private int bbs_level; //답변글 정렬순서
	private String bbs_date; //등록날짜
	
    //페이징(쪽나누기) 관련변수
	private int startrow; //시작행 번호
	private int endrow; //끝행번호
	
	//검색필드와 검색어
	private String find_field; //검색필드
	private String find_name; //검색어
	
	
	public int getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}
	public String getBbs_name() {
		return bbs_name;
	}
	public void setBbs_name(String bbs_name) {
		this.bbs_name = bbs_name;
	}
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public String getBbs_pwd() {
		return bbs_pwd;
	}
	public void setBbs_pwd(String bbs_pwd) {
		this.bbs_pwd = bbs_pwd;
	}
	public String getBbs_cont() {
		return bbs_cont;
	}
	public void setBbs_cont(String bbs_cont) {
		this.bbs_cont = bbs_cont;
	}
	public String getBbs_file() {
		return bbs_file;
	}
	public void setBbs_file(String bbs_file) {
		this.bbs_file = bbs_file;
	}
	public int getBbs_hit() {
		return bbs_hit;
	}
	public void setBbs_hit(int bbs_hit) {
		this.bbs_hit = bbs_hit;
	}
	public int getBbs_ref() {
		return bbs_ref;
	}
	public void setBbs_ref(int bbs_ref) {
		this.bbs_ref = bbs_ref;
	}
	public int getBbs_step() {
		return bbs_step;
	}
	public void setBbs_step(int bbs_step) {
		this.bbs_step = bbs_step;
	}
	public int getBbs_level() {
		return bbs_level;
	}
	public void setBbs_level(int bbs_level) {
		this.bbs_level = bbs_level;
	}
	public String getBbs_date() {
		return bbs_date;
	}
	public void setBbs_date(String bbs_date) {
	this.bbs_date = bbs_date.substring(0,10);
	//0이상 10미만 사이의 년월일만 반환
	}
	public int getStartrow() {
		return startrow;
	}

	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}	
}
