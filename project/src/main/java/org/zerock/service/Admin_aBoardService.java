package org.zerock.service;

import java.util.List;

import org.zerock.domain.AdminVO;

public interface Admin_aBoardService {

	int getRowabCount(AdminVO ab);

	List<AdminVO> getAbList(AdminVO ab);

	void insertabBoard(AdminVO ab);

	AdminVO getAdmin_aBoardCont(int admin_no);

	AdminVO ab_editList(int admin_no);

	void ab_editlist_up(AdminVO ab);

	void ab_ablist_del(int admin_no);

	

	

	

	

	

	

	

	

	

	

	

}
