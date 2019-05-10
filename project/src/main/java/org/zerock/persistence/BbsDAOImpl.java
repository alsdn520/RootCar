package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BbsVO;

@Repository
public class BbsDAOImpl implements BbsDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBbs(BbsVO b) {
		this.sqlSession.insert("bbs_in",b); //bbs_in이 insert 아이디명
	} //자료실 저장

	@Override
	public int getRowCount(BbsVO b) {  
		return this.sqlSession.selectOne("bbs_count",b);
	} //검색 전후 총 게시글 갯수
	
	@Override
	public List<BbsVO> getBbsList(BbsVO b) {
		return this.sqlSession.selectList("bbs_list",b);
		//selectList()는 복수개의 레코드를 검색해서 컬렉션 List로 반환, bbs_list는 bbs.xml에서 설정할 select 아이디명
	} //검색 전 후 목록
	
	@Override
	public void updateHit(int bbs_no) {
		this.sqlSession.update("bbs_hi",bbs_no);
		//update() 메서드는 레코드 수정, bbs_hi는 update 아이디명
	} //조회수 증가

	@Override
	public BbsVO getBbsCont(int bbs_no) {
		return this.sqlSession.selectOne("bbs_co",bbs_no);
		//게시글 번호에 해당하는 단 하나의 레코드 검색
	} //내용보기

	@Override
	public void editBbs(BbsVO b) {
		this.sqlSession.update("bbs_edit",b);
	} //자료실 수정

	@Override
	public void delBbs(int bbs_no) {
		this.sqlSession.delete("bbs_del",bbs_no);
		//delete() 메서드로 레코드 삭제, bbs_del은 bbs.xml에서 설정할 delete 아이디명
	} //답변글 게시글 번호 기준으로 자료실 삭제
	
	@Override
	public void delBbs2(int bbs_ref) {
		this.sqlSession.delete("bbs_del2",bbs_ref);
	} //원본글 글그룹 기준으로 자료실 삭제

	@Override
	public void updateLevel(BbsVO b) {
		this.sqlSession.update("level_up",b);
	} //답변 레벨 증가
	
	@Override
	public void replyBbs(BbsVO b) {
		this.sqlSession.insert("reply_in2",b);
	} //답변 저장

	@Override
	public void adminDel(int bbs_no) {
		this.sqlSession.delete("admin_del",bbs_no);
	} //관리자 게시글 삭제(원본글인 경우 글그룹 번호 기준으로 삭제)

	@Override
	public void adminDel2(int bbs_no) {
		this.sqlSession.delete("admin_del2",bbs_no);
	} //관리자 게시글 삭제(답변글인 경우 게시글 번호 기준으로 삭제)

	@Override
	public List<BbsVO> getBbsDB_file(int bbs_no) {
		return this.sqlSession.selectList("findFile",bbs_no);
		/* selectOne() 메서드는 mybatis에서 단 하나의 레코드 값만 반환한다. selectList() 메서드는 mybatis에서 복수개의 레코드 값을 반환한다.
		 */
	}

}
