package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.CarVO;
import org.zerock.domain.MemberVO;
import org.zerock.persistence.Admin_carDAO;
import org.zerock.persistence.CarDAO;

@Service

public class CarServiceimpl implements CarService{

	@Autowired
	private CarDAO carDAO;
	
	@Autowired
	private Admin_carDAO admin_carDAO;

	@Override
	public MemberVO getMember(String mem_id) {
		return this.carDAO.getMember(mem_id);
	}//차 예약할 창에 들어가면 로그인한 회원 정보를 그대로 input박스에 찍어주기 위해 읽어온다

	@Transactional
	@Override
	public void insertcar(CarVO car) {
		this.carDAO.insertcar(car);
	}//차 로그인한 회원 아이디 이름 이메일 폰번호  차종 차종위치 대여일시 반납일시 저장한 시간값 저장

	@Override
	public List<CarVO> total_CarList(CarVO cr) {
		return this.carDAO.total_CarList(cr);
	}//번호값기준검색
	
	
	
	
	
	
	
	
}
