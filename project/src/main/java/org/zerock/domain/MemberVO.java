package org.zerock.domain;

public class MemberVO {
	private int mem_no;      //번호
	private String mem_id;     // 회원 아이디
	private String mem_pwd;    // 회원 비번
	private String mem_pwd2;   // 회원 비번확인
	private String mem_name;   // 회원 이름
	private String mem_age;    // 회원 나이
	private String mem_addr;   // 회원 주소
	private String mem_email;  // 회원 메일 
	private String mem_phone;  // 회원 번호
	private String mem_phone02;// 회원 번호 
	private String mem_phone03;// 회원 번호 
	private int mem_hit;       // 회원 방문수 
	private int mem_edit;      // 회원 정보 수정수 
	private String mem_date;   // 회원 가입날짜
	
	private String delete_reason;       // -- 이거 계정 블랙걸때 사유 적을라고
	private String member_Activation;   // -- 계정 활성화 상태 즉 블랙을 걸거나탈퇴 시킬때 사용할라고
	
	//페이징 
	private int startrow; //시작행번호
	private int endrow;   //끝 행번호
	
	private String find_field;  //검색필드
	private String find_name;   //검색어
	
	public int getMem_edit() {
		return mem_edit;
	}
	public void setMem_edit(int mem_edit) {
		this.mem_edit = mem_edit;
	}
	//회원 정보 수정수 
	
	//검색필드
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
	//검색필드
	
	//페이징 
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
	//페이징 
	
	public String getDelete_reason() {
		return delete_reason;
	}
	public void setDelete_reason(String delete_reason) {
		this.delete_reason = delete_reason;
	}
	public String getMember_Activation() {
		return member_Activation;
	}
	public void setMember_Activation(String member_Activation) {
		this.member_Activation = member_Activation;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_pwd2() {
		return mem_pwd2;
	}
	public void setMem_pwd2(String mem_pwd2) {
		this.mem_pwd2 = mem_pwd2;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_age() {
		return mem_age;
	}
	public void setMem_age(String mem_age) {
		this.mem_age = mem_age;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_phone02() {
		return mem_phone02;
	}
	public void setMem_phone02(String mem_phone02) {
		this.mem_phone02 = mem_phone02;
	}
	public String getMem_phone03() {
		return mem_phone03;
	}
	public void setMem_phone03(String mem_phone03) {
		this.mem_phone03 = mem_phone03;
	}
	public int getMem_hit() {
		return mem_hit;
	}
	public void setMem_hit(int mem_hit) {
		this.mem_hit = mem_hit;
	}
	public String getMem_date() {
		return mem_date;
	}
	public void setMem_date(String mem_date) {
		this.mem_date = mem_date.substring(0, 10);
		
	}
	
	
}