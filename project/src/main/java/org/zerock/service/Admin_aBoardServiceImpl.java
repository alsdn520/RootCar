package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AdminVO;
import org.zerock.persistence.Admin_aBoardDAO;

@Service
public class Admin_aBoardServiceImpl implements Admin_aBoardService {

	@Autowired
	private Admin_aBoardDAO admin_aBoard;

	@Override
	public int getRowabCount(AdminVO ab) {
	return admin_aBoard.getRowabCount(ab);
	}

	@Override
	public List<AdminVO> getAbList(AdminVO ab) {
	return admin_aBoard.getAbList(ab);
	}

	@Override
	public void insertabBoard(AdminVO ab) {
	this.admin_aBoard.insertabBoard(ab);
		
	}

	@Override
	public AdminVO getAdmin_aBoardCont(int admin_no) {
		
		return this.admin_aBoard.getAdmin_aBoardCont(admin_no);
	}

	@Override
	public AdminVO ab_editList(int admin_no) {
		
		return this.admin_aBoard.ab_editList(admin_no);
	}

	@Override
	public void ab_editlist_up(AdminVO ab) {
		this.admin_aBoard.ab_editlist_up(ab);
		
	}

	@Override
	public void ab_ablist_del(int admin_no) {
		this.admin_aBoard.ab_ablist_del(admin_no);
		
	}

	
	
	

	
	

	
}
