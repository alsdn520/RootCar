package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MemberVO;

@Repository

public class MemberDAOimpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
//여기서 부터 회원 가입 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	@Override
	public MemberVO idcheck(String id) {
		return this.sqlSession.selectOne("m_check",id);
	}//아이디 중복검사
	
	@Override
	public void insertMember(MemberVO mb) {  
		this.sqlSession.insert("member_insert",mb);
	}//회원가입
	
	@Override
	public MemberVO selectMember_id(String mem_id) {
		return this.sqlSession.selectOne("select_one_id",mem_id);
	}//로그인 인증하기위해서 selectone 으로 회원 아이디만 가져온다 //동시에 로그인 횟수 1 증가 하기 트렌젝션 적용
	
	@Override
	public void edit_update(String mem_id) {
		this.sqlSession.update("member_hit",mem_id);
	}//회원 로그인시 방문수 증가 트랜젝션 적용 1트랜젝션 적용 1트랜젝션 적용 
	
//여기서 부터 회원 아이디/비번 검색 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	@Override
	public List<MemberVO> member_id_find(MemberVO mf) {
		return this.sqlSession.selectList("member_id_find",mf);
	}//아이디를 검색한다 (이름값과 번호값을 넘겨줌)
	
	@Override
	public MemberVO member_pwd_find(MemberVO mpf) {
		return this.sqlSession.selectOne("member_pwd_find",mpf);
	}//비번을 검색한다 (이름값과 아이디값 메일값 넘겨줌)


//여기서 부터 관리자 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	@Override
	public List<MemberVO> getMemberList() {
	    return this.sqlSession.selectList("member_list");
	}//회원목록 불러오기
	
	@Override
	public MemberVO editList(String  mem_id) {
		return this.sqlSession.selectOne("edit_list", mem_id);
	}//회원정보 수정하기 위해서 우선 리스트 띄어온다 이때 가져오는 값은 check Box 선택한 mem_id 기준이다

	@Override
	public void edit_update(MemberVO mb) {
		this.sqlSession.update("blackList",mb);
	}//회원블랙 지정 수정

	@Override
	public List<MemberVO> getMember_DisableList(String member_Activation_NO) {
		return this.sqlSession.selectList("blackList_total",member_Activation_NO);
	}//블랙리스트 지정되면 활성화 컬럼부분 데이터가 no가 된다 이때 no기준 컬럼으로 회원을 

	@Override
	public void member_delete(String delete_id) {
		this.sqlSession.delete("member_delete",delete_id);
	} //삭제

	@Override
	public List<MemberVO> search_list(MemberVO mb) {
		return this.sqlSession.selectList("admin_search_list",mb);
	}//검색한  id 값 기준으로 해당 아이디목록 
	
	@Override
	public int getRowCount(MemberVO mb) {
		return this.sqlSession.selectOne("admin_search_count",mb);		
	}//페이징 검색전후 레코드 개수
	
//여기서 부터 마이페이지 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	@Override
	public MemberVO mypage_selectMember_id(String mem_id) {
		return this.sqlSession.selectOne("my_page_select_one_id",mem_id);
	}//마이페이지 수정을 위해 로그인시 session 값으로 mem_id 를 가져온다 
	
	@Override
	public void My_page_edit_update(MemberVO mb) {
		this.sqlSession.update("My_page_edit_update",mb);
	}//마이페이지 내정보 수정

	@Override
	public void member_edit_count(MemberVO mb) {
		this.sqlSession.update("member_edit_count",mb);
	}//회원 정보를 수정하면 수정수 1 증가 

	@Override
	public MemberVO mypage_selectMember_no(int mem_no) {
		return this.sqlSession.selectOne("my_page_select_one_no",mem_no);
	}
	@Override
	public void delete_ok_member(MemberVO mb) {
		this.sqlSession.update("My_page_delete_update",mb);
	}//마이페이지 회원정보 삭제

}

