package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.CarVO;
import org.zerock.domain.MemberVO;

@Repository

public class CarDAOimpl implements CarDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO getMember(String mem_id) {
		return this.sqlSession.selectOne("Car_find_id",mem_id);
	}//차 예약할 창에 들어가면 로그인한 회원 정보를 그대로 input박스에 찍어주기 위해 읽어온다

	@Override
	public void insertcar(CarVO car) {
		this.sqlSession.insert("Car_insert",car);
	}//차 로그인한 회원 아이디 이름 이메일 폰번호  차종 차종위치 대여일시 반납일시 저장한 시간값 저장

	@Override
	public List<CarVO> total_CarList(CarVO cr) {
		return this.sqlSession.selectList("total_admin_CarList",cr);
	}//번호값기준검색

	
}	
	
	

