package com.peachmarket.opticyellow.confirm.model;

import java.util.List;

public interface ConfirmDAO {

	List<ConfirmVO> selectList_Seller(ConfirmVO vo);

	ConfirmVO C_SELECTLIST_SELLER_INFO(ConfirmVO vo);

	List<ConfirmVO> selectList_Buyer(ConfirmVO vo);

	ConfirmVO C_SELECTLIST_BUYER_INFO(ConfirmVO vo);

	int deal_done_Ok(ConfirmVO vo);

	List<ConfirmVO> deal_done_check(ConfirmVO vo);


	

	

}
