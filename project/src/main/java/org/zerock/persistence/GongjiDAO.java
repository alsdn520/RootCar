package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.GongjiVO;

public interface GongjiDAO {

	void insertGongji(GongjiVO g); //공지 추가

	int getRowCount(GongjiVO g); //검색 전후 총 공지 갯수 

	List<GongjiVO> getGongjiList(GongjiVO g); //공지 목록

	void updateHit(int gongji_no); //조회수 증가

	GongjiVO getGongjiCont(int gongji_no); //내용보기+수정후 내용보기(조회수 증가 안함)

	void editGongji(GongjiVO g); //공지 수정

	void delGongji(GongjiVO g); //공지 삭제

}
