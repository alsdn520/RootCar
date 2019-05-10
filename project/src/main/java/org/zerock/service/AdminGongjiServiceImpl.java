package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.GongjiVO;
import org.zerock.persistence.AdminGongjiDAO;

@Service
public class AdminGongjiServiceImpl implements AdminGongjiService {

	
	@Autowired
	private AdminGongjiDAO adminGongjiDAO;

	@Override
	public int getRowCount(GongjiVO g) {
		return this.adminGongjiDAO.getRowCount(g);
	}

	@Override
	public List<GongjiVO> getGongjiList(GongjiVO g) {
		return this.adminGongjiDAO.getGongjiList(g);
	}
	
}
