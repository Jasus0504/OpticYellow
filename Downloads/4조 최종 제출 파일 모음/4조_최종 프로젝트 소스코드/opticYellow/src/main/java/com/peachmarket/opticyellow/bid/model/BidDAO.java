package com.peachmarket.opticyellow.bid.model;

import java.util.List;

public interface BidDAO {

	int b_insert(BidVO vo);
	
	List<BidVO> b_selectAll();
	
	BidVO b_selectone_High(BidVO vo);

	List<BidVO> b_selectList_FinalHigh();

	List<BidVO> b_sell_list(BidVO vo);

	List<BidVO> b_buy_list(BidVO vo);

	List<BidVO> b_bought_list(BidVO vo);

	List<BidVO> b_sold_list(BidVO vo);

}
