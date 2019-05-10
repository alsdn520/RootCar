package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.GongjiVO;

@Repository
public class AdminGongjiDAOImpl implements AdminGongjiDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getRowCount(GongjiVO g) {
		return this.sqlSession.selectOne("ag_count",g);
	} //관리자 공지 검색전후 레코드 개수

	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return null;
	} //관리자 공지목록 검색전후 레코드개수
	
}
