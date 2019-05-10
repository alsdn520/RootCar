package org.zerock.domain;

public class CarVO {
	private int car_no; 					 //시쿼스 번호값 
	private String car_member_name;            //빌린회원 아이디
	private String car_member_email;         //빌린회원 이메일
	private String car_member_phone;         //빌린회원 번호
	
	private String car_name;                 //차 이름
	private String car_location;             //차 위치
	private String car_Start;                //차 빌린날
	private String car_End;                  //치 반납
	private String rent_price;               //차 대여 요금
	
	private String car_date;                 //-예약이게 예약 등록된 데이터 
	private String car_Activation; 
	private int car_common;   //걍 공통
	

	
	
	public int getCar_common() {
		return car_common;
	}

	public void setCar_common(int car_common) {
		this.car_common = car_common;
	}

	public String getRent_price() {
		return rent_price;
	}

	public void setRent_price(String rent_price) {
		this.rent_price = rent_price;
	}

	public String getCar_Activation() {
		return car_Activation;
	}

	public void setCar_Activation(String car_Activation) {
		this.car_Activation = car_Activation;
	}

	public int getCar_no() {
		return car_no;
	}

	public void setCar_no(int car_no) {
		this.car_no = car_no;
	}
	
	public String getCar_member_name() {
		return car_member_name;
	}

	public void setCar_member_name(String car_member_name) {
		this.car_member_name = car_member_name;
	}

	public String getCar_member_email() {
		return car_member_email;
	}

	public void setCar_member_email(String car_member_email) {
		this.car_member_email = car_member_email;
	}

	public String getCar_member_phone() {
		return car_member_phone;
	}

	public void setCar_member_phone(String car_member_phone) {
		this.car_member_phone = car_member_phone;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}

	public String getCar_location() {
		return car_location;
	}

	public void setCar_location(String car_location) {
		this.car_location = car_location;
	}

	public String getCar_Start() {
		return car_Start;
	}

	public void setCar_Start(String car_Start) {
		this.car_Start = car_Start;
	}

	public String getCar_End() {
		return car_End;
	}

	public void setCar_End(String car_End) {
		this.car_End = car_End;
	}

	public String getCar_date() {
		return car_date;
	}

	public void setCar_date(String car_date) {
		this.car_date = car_date;
	}
	
	
	
	
	
}
