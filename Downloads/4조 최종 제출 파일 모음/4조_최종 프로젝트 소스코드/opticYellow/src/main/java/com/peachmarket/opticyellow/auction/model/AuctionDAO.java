package com.peachmarket.opticyellow.auction.model;

import java.util.List;

public interface AuctionDAO {

	List<AuctionVO> auctionBuyList(AuctionVO vo);

	List<AuctionVO> auctionSaleList(AuctionVO vo);

}
