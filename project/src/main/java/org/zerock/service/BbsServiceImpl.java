package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BbsVO;
import org.zerock.persistence.BbsDAO;

@Service
public class BbsServiceImpl implements BbsService {

	@Autowired
	private BbsDAO bbsDAO;

	@Override
	public void insertBbs(BbsVO b) {
		this.bbsDAO.insertBbs(b);
	} //게시판 저장

	@Override
	public int getRowCount(BbsVO b) {
		return this.bbsDAO.getRowCount(b);
	} //검색 전후 총 게시글 갯수
	
	@Override
	public List<BbsVO> getBbsList(BbsVO b) {
		return this.bbsDAO.getBbsList(b);
	} //게시판 목록

	//트랜잭션 적용
	@Transactional
	@Override
	public BbsVO getBbsCont(int bbs_no) {
		this.bbsDAO.updateHit(bbs_no); //조회수 증가
		return this.bbsDAO.getBbsCont(bbs_no); //내용보기
	} //게시판 내용(조회수 증가)
	
	@Override
	public BbsVO getBbsCont2(int bbs_no) {
		return this.bbsDAO.getBbsCont(bbs_no); //내용보기
	} //수정 후 내용(조회수 증가 안함)

	
	@Override
	public void editBbs(BbsVO b) {
		this.bbsDAO.editBbs(b);
	} //게시판 수정

	@Override
	public void delBbs(int bbs_no) {
		this.bbsDAO.delBbs(bbs_no); //답변글 게시글 번호 기준으로 삭제
	} 
	
	@Override
	public void delBbs2(int bbs_ref) {
		this.bbsDAO.delBbs2(bbs_ref); //원본글 게시글 글그룹 기준으로 삭제
	}

	//트랜잭션 적용
	@Transactional
	@Override
	public void replyBbs(BbsVO b) {
		this.bbsDAO.updateLevel(b); //답변 레벨증가
		this.bbsDAO.replyBbs(b); //답변저장
	}

	@Override
	public void adminDel(int bbs_no) {
		this.bbsDAO.adminDel(bbs_no);
	} //관리자 게시글 삭제(원본글인 경우 글그룹 번호 기준으로 삭제)

	@Override
	public void adminDel2(int bbs_no) {
		this.bbsDAO.adminDel2(bbs_no);
	} //관리자 게시글 삭제(답변글인 경우 게시글 번호 기준으로 삭제)

	@Override
	public List<BbsVO> getBbsDB_file(int bbs_no){ 
		return this.bbsDAO.getBbsDB_file(bbs_no);
	}
	
}
