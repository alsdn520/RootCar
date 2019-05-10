package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AdminVO;
import org.zerock.persistence.AdminDAO;

@Service //스프링에 서비스 등록
public class AdminServiceImpl 
implements AdminService {

	@Autowired
    private AdminDAO adminDAO;	
	
	@Override
	public void insertAdmin(AdminVO ab) {
		this.adminDAO.insertAdmin(ab);		
	}

	@Override
	public AdminVO adminLogin(String admin_id) {
     return this.adminDAO.adminLogin(admin_id);
	}
}



