package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.GongjiVO;

public interface AdminGongjiDAO {

	int getRowCount(GongjiVO g);

	List<GongjiVO> getGongjiList(GongjiVO g);

}
