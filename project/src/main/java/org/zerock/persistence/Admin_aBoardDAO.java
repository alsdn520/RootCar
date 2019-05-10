package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.AdminVO;

public interface Admin_aBoardDAO {

	int getRowabCount(AdminVO ab);

	List<AdminVO> getAbList(AdminVO ab);

	void insertabBoard(AdminVO ab);

	void ab_editlist_up(AdminVO ab);

	AdminVO ab_editList(int admin_no);

	AdminVO getAdmin_aBoardCont(int admin_no);

	void ab_ablist_del(int admin_no);

	

}
