package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public void replyinsert(ReplyVO rv) {
		this.replyDAO.replyinsert(rv);
	} //댓글 저장

	@Override
	public List<ReplyVO> getReplyList(int bbs_no) {
		return this.replyDAO.getReplyList(bbs_no);
	} //게시판 번호를 기준으로 댓글 목록 불러오기

	@Override
	public ReplyVO getReplyCont(int reply_no) {
		return this.replyDAO.getReplyCont(reply_no);
	} //수정을 위해 댓글 내용 가져오기
	
	@Override
	public void replyedit(ReplyVO rv) {
		this.replyDAO.replyedit(rv);
	} //댓글 수정

	@Override
	public void delReply(int reply_no) {
		this.replyDAO.delReply(reply_no);
	} //댓글 삭제
	
}
