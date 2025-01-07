package com.peachmarket.opticyellow.confirm.service;

import java.util.List;    

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.bid.model.BidDAO;
import com.peachmarket.opticyellow.bid.model.BidVO;
import com.peachmarket.opticyellow.confirm.model.ConfirmDAO;
import com.peachmarket.opticyellow.confirm.model.ConfirmVO;
import com.peachmarket.opticyellow.product.model.ProductDAO;
import com.peachmarket.opticyellow.product.model.ProductVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ConfirmService {

	@Autowired
	ConfirmDAO dao;


	public List<ConfirmVO> selectList_Seller(ConfirmVO vo) {
		log.info("/service...{}",vo);
		return dao.selectList_Seller(vo);
	}


	public ConfirmVO C_SELECTLIST_SELLER_INFO(ConfirmVO vo) {
		log.info("/service...{}",vo);
		return dao.C_SELECTLIST_SELLER_INFO(vo);
	}


	public List<ConfirmVO> selectList_Buyer(ConfirmVO vo) {
		log.info("/service...{}",vo);
		return dao.selectList_Buyer(vo);
	}


	public ConfirmVO C_SELECTLIST_BUYER_INFO(ConfirmVO vo) {
		log.info("/service...{}",vo);
		return dao.C_SELECTLIST_BUYER_INFO(vo);
	}


	public int deal_done_Ok(ConfirmVO vo) {
		log.info("/service...{}",vo);
		return dao.deal_done_Ok(vo);
	}


	public List<ConfirmVO> deal_done_check(ConfirmVO vo) {
		return dao.deal_done_check(vo);
	}



}
