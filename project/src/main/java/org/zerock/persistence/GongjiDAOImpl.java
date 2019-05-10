package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.GongjiVO;

@Repository
public class GongjiDAOImpl implements GongjiDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertGongji(GongjiVO g) {
		this.sqlSession.insert("gongji_in",g);
	} //공지사항 저장

	@Override
	public int getRowCount(GongjiVO g) {
		return this.sqlSession.selectOne("gongji_row",g);
	} //총 레코드 개수+검색전후 레코드 개수

	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return this.sqlSession.selectList("gongji_li",g);
	} //게시판 목록

	@Override
	public void updateHit(int gongji_no) {
		this.sqlSession.update("gongji_hit",gongji_no);
	} //조회수 증가

	@Override
	public GongjiVO getGongjiCont(int gongji_no) {
		return this.sqlSession.selectOne("gongji_cont",gongji_no);
		//공지 번호에 해당하는 단 하나의 레코드 검색
	} //내용보기

	@Override
	public void editGongji(GongjiVO g) {
		this.sqlSession.update("gongji_edit",g);
	} //공지 수정

	@Override
	public void delGongji(GongjiVO g) {
		this.sqlSession.delete("gongji_del",g);
	} //공지 삭제

}
