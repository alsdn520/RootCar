package org.zerock.service;

import java.util.List;

import org.zerock.domain.GongjiVO;

public interface AdminGongjiService {

	int getRowCount(GongjiVO g);

	List<GongjiVO> getGongjiList(GongjiVO g);

}
