package org.zerock.service;

import java.util.List;

import org.zerock.domain.GongjiVO;

public interface GongjiService {

	void insertGongji(GongjiVO g); //공지 추가

	int getRowCount(GongjiVO g); //검색전후 총 레코드 갯수

	List<GongjiVO> getGongjiList(GongjiVO g); //공지 목록

	GongjiVO getGongjiCont(int gongji_no); //내용보기(조회수 증가)

	GongjiVO getGongjiCont2(int gongji_no); //수정,삭제 후 내용보기(조회수 증가 안함)

	void editGongji(GongjiVO g); //공지 수정

	void delGongji(GongjiVO g); //공지 삭제

}
