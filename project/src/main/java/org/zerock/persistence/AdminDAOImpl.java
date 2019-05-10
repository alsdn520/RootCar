package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.AdminVO;

@Repository
public class AdminDAOImpl 
implements AdminDAO {

	@Autowired //자동의존성 주입
	private SqlSession sqlSession;
	//mybatis 쿼리문 실행객체 sqlSession 생성

	@Override
	public void insertAdmin(AdminVO ab) {
		this.sqlSession.insert("admin_in",ab);				
	}//관리자 정보 저장	

	@Override
	public AdminVO adminLogin(String admin_id) {
		return this.sqlSession.selectOne("admin_login",admin_id);
	}//관리자 로그인 인증
}






