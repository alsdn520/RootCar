package org.zerock.service;

import java.util.List;

import javax.mail.MessagingException;

import org.zerock.domain.MemberVO;

public interface MemberService {
	
//여기서 부터 회원 가입 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
	MemberVO idcheck(String id);  //아이디 중복 검사 
	
	void insertMember(MemberVO mb); //회원저장
	
	MemberVO selectMember_id(String mem_id);  //로그인 인증하기위해서 selectone 으로 회원 아이디만 가져온다
	
//여기서 부터 회원 아이디/비번 검색 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
	List<MemberVO> member_id_find(MemberVO mf);  //아이디를 검색한다 (이름값과 번호값을 넘겨줌)
	
	MemberVO member_pwd_find(MemberVO mpf); //비번을 검색한다 (이름값과 아이디값 메일값 넘겨줌)
	
	void sendMail(String to, String subject, String mail_cont) throws MessagingException;  //메일발송부분

	
//여기서 부터 관리자 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
	List<MemberVO> getMemberList(); //회원목록 불러오기
	
	MemberVO editList(String  mem_id);  //회원정보 수정하기 위해서 우선 리스트 띄어온다 이때 가져오는 값은 check Box 선택한  mem_id 기준이다
	
	void edit_update(MemberVO mb); //회원블랙 수정 
	
	List<MemberVO> getMember_DisableList(String member_Activation_NO); //블랙리스트 지정되면 활성화 컬럼부분 데이터가 no가 된다 이때 no기준 컬럼으로 회원을 
	
	void member_delete(String delete_id); //삭제
	
	List<MemberVO> search_list(MemberVO mb); //검색한  id 값 기준으로 해당 아이디목록 
	
	int getRowCount(MemberVO mb);//페이징 검색전후 레코드 개수

//여기서 부터 마이페이지 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
	MemberVO mypage_selectMember_id(String mem_id);//마이페이지 수정을 위해 로그인시 session 값으로 id 를 가져온다 
	
	void My_page_edit_update(MemberVO mb); //마이페이지 내정보 수정 
	
	MemberVO mypage_selectMember_no(int mem_no);//회원탈퇴시 비번을 확인하기 위해 번호를 기준으로 읽어온다
	
	void delete_ok_member(MemberVO mb);  //마이페이지 회원정보 삭제

	

}
