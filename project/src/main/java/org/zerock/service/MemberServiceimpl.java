package org.zerock.service;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.persistence.MemberDAO;

@Service

public class MemberServiceimpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private JavaMailSender mailSender;//메일 보내는 메일센더 자동의존성 주입

//여기서 부터 회원 가입 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		
	@Override
	public MemberVO idcheck(String id) {
		return this.memberDAO.idcheck(id);
	}//아이디 중복 검사 
		
	@Override 
	public void insertMember(MemberVO mb) {
		this.memberDAO.insertMember(mb);	
	}//회원저장

	@Transactional
	@Override
	public MemberVO selectMember_id(String mem_id) {
		this.memberDAO.edit_update(mem_id);
		return this.memberDAO.selectMember_id(mem_id);	
	}//로그인 인증하기위해서 selectone 으로 회원 아이디만 가져온다
	
//여기서 부터 회원 아이디/비번 검색 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
	@Override
	public List<MemberVO> member_id_find(MemberVO mf) {
		return this.memberDAO.member_id_find(mf);
	}//아이디를 검색한다 (이름값과 번호값을 넘겨줌)
	
	@Override
	public MemberVO member_pwd_find(MemberVO mpf) {
		return this.memberDAO.member_pwd_find(mpf);
	}//비번을 검색한다 (이름값과 아이디값 메일값 넘겨줌)
	
	@Override
	public void sendMail(String to, String subject, String mail_cont) throws MessagingException {
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
		String from = "xogud02112@gmail.com";			
		helper.setFrom(from);//보내는 관리자 메일주소
		helper.setTo(to);//받는 사람 메일 주소
		helper.setSubject(subject);//메일 제목
		helper.setText(mail_cont, true);//메일 내용
		mailSender.send(msg);//실제 메일 발송	
		
	}
	
//여기서 부터 관리자 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
	@Override
	public List<MemberVO> getMemberList() {
		return this.memberDAO.getMemberList();
	}//회원목록 불러오기

	@Override
	public MemberVO editList(String mem_id) {
		return this.memberDAO.editList(mem_id);
	}//회원정보 수정하기 위해서 우선 리스트 띄어온다 이때 가져오는 값은 check Box 선택한  mem_id 기준이다

	@Override
	public void edit_update(MemberVO mb) {
		this.memberDAO.edit_update(mb);
	}//회원 블랙수정

	@Override
	public List<MemberVO> getMember_DisableList(String member_Activation_NO) {
		// TODO Auto-generated method stub
		return this.memberDAO.getMember_DisableList(member_Activation_NO);
	}//블랙리스트 지정되면 활성화 컬럼부분 데이터가 no가 된다 이때 no기준 컬럼으로 회원을 

	@Override
	public void member_delete(String delete_id) {
		this.memberDAO.member_delete(delete_id);
	} //삭제

	@Override
	public List<MemberVO> search_list(MemberVO mb) {
		return this.memberDAO.search_list(mb);
	}//검색한  id 값 기준으로 해당 아이디목록 

	@Override
	public int getRowCount(MemberVO mb) {
		return this.memberDAO.getRowCount(mb);
	}//페이징 검색전후 레코드 개수

//여기서 부터 마이페이지 부분 
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		
	@Override
	public MemberVO mypage_selectMember_id(String mem_id) {
		return this.memberDAO.mypage_selectMember_id(mem_id);
	}//마이페이지 수정을 위해 로그인시 session 값으로 pwd 를 가져온다 

	@Transactional
	@Override
	public void My_page_edit_update(MemberVO mb) {
		this.memberDAO.My_page_edit_update(mb);
		this.memberDAO.member_edit_count(mb);
		//회원 정보를 수정하면 수정수 1 증가 
	}//마이페이지 내정보 수정 

	@Override
	public MemberVO mypage_selectMember_no(int mem_no) {
		return this.memberDAO.mypage_selectMember_no(mem_no);
	}//회원탈퇴시 비번을 확인하기 위해 번호를 기준으로 읽어온다
	
	@Override
	public void delete_ok_member(MemberVO mb) {
		this.memberDAO.delete_ok_member(mb);
	}//마이페이지 회원정보 삭제

	


}

