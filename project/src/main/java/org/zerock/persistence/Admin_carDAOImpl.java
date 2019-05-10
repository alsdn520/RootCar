package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.zerock.domain.CarVO;
import org.zerock.domain.PrVO;

@Repository
public class Admin_carDAOImpl implements Admin_carDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void pr_insert(PrVO p) {
		this.sqlSession.insert("pr_p",p);
		
	}

	@Override
	public List<PrVO> getCarImgList() {
	return this.sqlSession.selectList("pr_list");
	}

	@Override
	public List<PrVO> getPrList(PrVO p) {
	return this.sqlSession.selectList("getPrList", p);
	}

	@Override
	public PrVO car_editList(int pr_no) {
	return this.sqlSession.selectOne("car_editList", pr_no);
	}

	@Override
	public void car_editlist_up(PrVO p) {
	this.sqlSession.update("car_editlist_up", p);
		
	}

	@Override
	public void car_prlist_del(int pr_no) {
	this.sqlSession.delete("car_prlist_del", pr_no);
		
	}

	@Override
	public int getRowCount(PrVO p) {
	return this.sqlSession.selectOne("getRowCount",p);
	}

	
	
	
	@Override
	public List<PrVO> select_all_car(PrVO pr) {
		return this.sqlSession.selectList("select_all_carlist",pr);
	}

	@Override
	public PrVO db_pr_price_find(String car_name) {
		return this.sqlSession.selectOne("db_pr_price_find", car_name);
	}//여기가 차종과 위치를 비교해서 해당 디비 값을 가져온다 
	
	@Override
	public void update_Activation(PrVO pr) {
		this.sqlSession.update("update_Activation",pr);
	}//예약되면 활성화 부분 no


}
