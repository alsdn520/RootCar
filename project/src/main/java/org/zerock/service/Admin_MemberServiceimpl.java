package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AdminVO;
import org.zerock.persistence.Admin_MemberDAO;

@Service

public class Admin_MemberServiceimpl implements Admin_MemberService{
	
	@Autowired
	private Admin_MemberDAO admin_MemberDAO;

	@Override
	public int getRowCount(AdminVO m) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
