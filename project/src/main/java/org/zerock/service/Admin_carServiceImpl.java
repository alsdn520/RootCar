package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.zerock.domain.PrVO;
import org.zerock.persistence.Admin_carDAO;

@Service
public class Admin_carServiceImpl implements Admin_carService {
	
	@Autowired
	private Admin_carDAO admin_carDAO;
	
	@Override
	public void pr_insert(PrVO p) {
		this.admin_carDAO.pr_insert(p);
		
	}

	@Override
	public List<PrVO> getCarImgList() {		
		return this.admin_carDAO.getCarImgList();
		
	}

	@Override
	public List<PrVO> getPrList(PrVO p) {
	return this.admin_carDAO.getPrList(p);
	}

	@Override
	public PrVO car_editList(int pr_no) {
	return this.admin_carDAO.car_editList(pr_no);
	}

	@Override
	public void car_editlist_up(PrVO p) {
	this.admin_carDAO.car_editlist_up(p);
		
	}

	@Override
	public void car_prlist_del(int pr_no) {
	this.admin_carDAO.car_prlist_del(pr_no);
	}

	@Override
	public int getRowCount(PrVO p) {
		return this.admin_carDAO.getRowCount(p);
	}

	
	
	
	
	@Override
	public List<PrVO> select_all_car(PrVO pr) {
		return this.admin_carDAO.select_all_car(pr);
	
	}
	@Override
	public PrVO db_pr_price_find(String car_name) {
		return this.admin_carDAO.db_pr_price_find(car_name);
	}//여기가 차종과 위치를 비교해서 해당 디비 값을 가져온다 
	
	@Override
	public void update_Activation(PrVO pr) {
		this.admin_carDAO.update_Activation(pr);
	}//예약되면 활성화 부분 no



}
