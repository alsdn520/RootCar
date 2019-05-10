package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.CarVO;
import org.zerock.domain.MemberVO;

public interface CarDAO {

	MemberVO getMember(String mem_id);//차 예약할 창에 들어가면 로그인한 회원 정보를 그대로 input박스에 찍어주기 위해 읽어온다

	void insertcar(CarVO car);//차 로그인한 회원 아이디 이름 이메일 폰번호  차종 차종위치 대여일시 반납일시 저장한 시간값 저장

	List<CarVO> total_CarList(CarVO cr);//번호값기준검색

}
