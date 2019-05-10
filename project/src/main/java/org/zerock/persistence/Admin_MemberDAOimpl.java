package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository

public class Admin_MemberDAOimpl implements Admin_MemberDAO{

	@Autowired
	private SqlSession sqlsession;
	
}
