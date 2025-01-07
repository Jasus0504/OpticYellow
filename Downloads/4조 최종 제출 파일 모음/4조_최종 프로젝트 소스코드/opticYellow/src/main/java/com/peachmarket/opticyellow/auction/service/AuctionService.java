package com.peachmarket.opticyellow.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.auction.model.AuctionDAO;
import com.peachmarket.opticyellow.auction.model.AuctionVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AuctionService {

	@Autowired
	AuctionDAO dao;

	public List<AuctionVO> auctionBuyList(AuctionVO vo) {
		return dao.auctionBuyList(vo);
	}

	public List<AuctionVO> auctionSaleList(AuctionVO vo) {
		return dao.auctionSaleList(vo);
	}

}
