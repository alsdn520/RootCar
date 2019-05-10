package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.GongjiVO;
import org.zerock.persistence.GongjiDAO;

@Service
public class GongjiServiceimpl implements GongjiService{

	@Autowired
	private GongjiDAO gongjiDAO;

	@Override
	public void insertGongji(GongjiVO g) {
		this.gongjiDAO.insertGongji(g);
	} //공지사항 추가

	@Override
	public int getRowCount(GongjiVO g) {
		return this.gongjiDAO.getRowCount(g);
	} //검색 전후 총 공지 갯수

	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return this.gongjiDAO.getGongjiList(g);
	} //공지 목록

	//트랜잭션 적용
	@Transactional
	@Override
	public GongjiVO getGongjiCont(int gongji_no) {
		this.gongjiDAO.updateHit(gongji_no); //조회수 증가
		return this.gongjiDAO.getGongjiCont(gongji_no); //내용보기
	} //내용보기(조회수 증가)

	@Override
	public GongjiVO getGongjiCont2(int gongji_no) {
		return this.gongjiDAO.getGongjiCont(gongji_no); //내용보기
	} //수정 후 내용보기(조회수 증가 안함)

	@Override
	public void editGongji(GongjiVO g) {
		this.gongjiDAO.editGongji(g);
	} //공지 수정

	@Override
	public void delGongji(GongjiVO g) {
		this.gongjiDAO.delGongji(g);
	} //공지 삭제
	
}
