package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.ReplyVO;

public interface ReplyDAO {

	void replyinsert(ReplyVO rv); //댓글 저장
	
	List<ReplyVO> getReplyList(int bbs_no); //게시글 번호를 기준으로 댓글 목록 불러오기

	ReplyVO getReplyCont(int reply_no); //수정을 위해 댓글 내용 가져오기

	void replyedit(ReplyVO rv); //댓글 수정

	void delReply(int reply_no); //댓글 삭제

}
