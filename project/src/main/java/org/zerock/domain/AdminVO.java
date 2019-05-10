package org.zerock.domain;

public class AdminVO {//관리자 저장빈 클래스
 /* admin테이블 컬럼명과 변수명을 일치시킨다.  */
	
	private int admin_no; //번호
	private String admin_id;//관리자 아이디
	private String admin_pwd;//관리자 비번
	private String admin_name;//관리자 이름
	private String admin_date;//등록날짜
	//게시판쓸때 쓸것
	private String admin_title;//제목
	private String admin_cont;//내용
	private int startrow;//시작행번호
	private int endrow;//끝행번호
	private String find_field;//검색필드
	private String find_name;//검색어
	
	
	
	
	
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
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
	public String getAdmin_title() {
		return admin_title;
	}
	public void setAdmin_title(String admin_title) {
		this.admin_title = admin_title;
	}
	public String getAdmin_cont() {
		return admin_cont;
	}
	public void setAdmin_cont(String admin_cont) {
		this.admin_cont = admin_cont;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_date() {
		return admin_date;
	}
	public void setAdmin_date(String admin_date) {
		this.admin_date = admin_date.substring(0,10);//0이상 10미만 사이의 년월일만 반환 
	}
	
}
