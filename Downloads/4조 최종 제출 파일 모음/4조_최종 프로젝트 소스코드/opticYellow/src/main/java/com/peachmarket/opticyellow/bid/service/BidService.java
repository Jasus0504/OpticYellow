package com.peachmarket.opticyellow.bid.service;

import java.util.List;   

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.bid.model.BidDAO;
import com.peachmarket.opticyellow.bid.model.BidVO;
import com.peachmarket.opticyellow.product.model.ProductDAO;
import com.peachmarket.opticyellow.product.model.ProductVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class BidService {

	@Autowired
	BidDAO dao;

	public int b_insert(BidVO vo) {
		return dao.b_insert(vo);
	}
	
	public List<BidVO> b_selectAll() {
		return dao.b_selectAll();
	}

	
	public BidVO selectone_High(BidVO vo) {
		return dao.b_selectone_High(vo);
	}

	public List<BidVO> selectList_FinalHigh() {
		return dao.b_selectList_FinalHigh();
	}

	public List<BidVO> b_buy_list(BidVO vo) {
		// TODO Auto-generated method stub
		return dao.b_buy_list(vo);
	}

	public List<BidVO> b_sell_list(BidVO vo) {
		// TODO Auto-generated method stub
		return dao.b_sell_list(vo);
	}

	public List<BidVO> b_bought_list(BidVO vo) {
		// TODO Auto-generated method stub
		return dao.b_bought_list(vo);
	}

	public List<BidVO> b_sold_list(BidVO vo) {
		// TODO Auto-generated method stub
		return dao.b_sold_list(vo);
	}



//	public ProductVO selectOne(ProductVO vo) {
//		return dao.selectOne(vo);
//		
//	}
//
//	public int insert(ProductVO vo) {
//		return dao.insert(vo);
//		
//	}
//


}
