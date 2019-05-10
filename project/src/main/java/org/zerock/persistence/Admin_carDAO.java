package org.zerock.persistence;

import java.util.List;

import org.springframework.ui.Model;
import org.zerock.domain.CarVO;
import org.zerock.domain.PrVO;

public interface Admin_carDAO {

	void pr_insert(PrVO p);

	List<PrVO> getCarImgList();

	List<PrVO> getPrList(PrVO p);
	
	PrVO car_editList(int pr_no);

	void car_editlist_up(PrVO p);

	void car_prlist_del(int pr_no);

	int getRowCount(PrVO p);

	
	
	List<PrVO> select_all_car(PrVO pr);
	PrVO db_pr_price_find(String car_name);//여기가 차종과 위치를 비교해서 해당 디비 값을 가져온다 
	void update_Activation(PrVO pr);//예약되면 활성화 부분 no




	



}
