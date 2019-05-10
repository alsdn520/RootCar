package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void replyinsert(ReplyVO rv) {
		this.sqlSession.insert("reply_in",rv);
	} //댓글 저장

	@Override
	public List<ReplyVO> getReplyList(int bbs_no) {
		return this.sqlSession.selectList("reply_list",bbs_no);
	} //게시글 번호를 기준으로 복수개의 댓글 목록 불러오기

	@Override
	public ReplyVO getReplyCont(int reply_no) {
		return this.sqlSession.selectOne("reply_cont",reply_no);
	} //댓글 수정을 위해 댓글 내용 가져오기(단 하나의 레코드)

	@Override
	public void replyedit(ReplyVO rv) {
		this.sqlSession.update("reply_edit",rv);
	} //댓글 수정

	@Override
	public void delReply(int reply_no) {
		this.sqlSession.delete("reply_del",reply_no);
	} //댓글 삭제
}
