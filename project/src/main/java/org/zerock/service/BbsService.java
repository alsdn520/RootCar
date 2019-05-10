package org.zerock.service;

import java.util.List;

import org.zerock.domain.BbsVO;

public interface BbsService {
	
	void insertBbs(BbsVO b); //댓글저장

	int getRowCount(BbsVO b); //검색 전후 총 게시글 갯수

	List<BbsVO> getBbsList(BbsVO b); //게시판 목록

	BbsVO getBbsCont(int bbs_no); //게시판 내용(조회수 증가)

	BbsVO getBbsCont2(int bbs_no); //수정,삭제 후 내용(조회수 증가 안함)

	void editBbs(BbsVO b); //게시글 수정

	void delBbs(int bbs_no); //답변글 게시글 번호 기준으로 게시글 삭제

	void delBbs2(int bbs_ref); //원본글 게시글 글그룹번호 기준으로 게시글 삭제
	
	void replyBbs(BbsVO b); //게시글 답변

	void adminDel(int bbs_no); //관리자 게시글 삭제(원본글인 경우 글그룹 기준으로 삭제)

	void adminDel2(int bbs_no); //관리자 게시글 삭제(답변글인 경우 게시글 번호를 기준으로 삭제)

	List<BbsVO> getBbsDB_file(int bbs_no);
	
}
