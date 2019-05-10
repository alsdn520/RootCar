package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.AdminVO;

@Repository
public class Admin_aBoardDAOImpl implements Admin_aBoardDAO {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getRowabCount(AdminVO ab) {
	return sqlSession.selectOne("getRowabCount", ab);
	}

	@Override
	public List<AdminVO> getAbList(AdminVO ab) {
	return sqlSession.selectList("getAbList", ab);
	}

	@Override
	public void insertabBoard(AdminVO ab) {
	this.sqlSession.insert("insertabBoard", ab);
		
	}

	@Override
	public AdminVO getAdmin_aBoardCont(int admin_no) {
		
		return this.sqlSession.selectOne("getAdmin_aBoardCont",admin_no);
	}

	@Override
	public AdminVO ab_editList(int admin_no) {
		
		return this.sqlSession.selectOne("ab_editList", admin_no);
	}

	@Override
	public void ab_editlist_up(AdminVO ab) {
		this.sqlSession.update("ab_editlist_up",ab);
		
	}

	@Override
	public void ab_ablist_del(int admin_no) {
		this.sqlSession.delete("ab_ablist_del",admin_no);
		
	}

	
	

	

	
}
