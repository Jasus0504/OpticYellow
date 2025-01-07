package com.peachmarket.opticyellow.confirm.controller;


import java.awt.Graphics2D;    
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.bid.model.BidVO;
import com.peachmarket.opticyellow.confirm.model.ConfirmVO;
import com.peachmarket.opticyellow.confirm.service.ConfirmService;


import lombok.extern.slf4j.Slf4j;

 
/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class ConfirmRestController {
	
	@Autowired
	ConfirmService service;
	
	@Autowired
	ServletContext sContext;
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/json_searchSeller.do", method = RequestMethod.GET)
	public List<ConfirmVO> json_searchSeller(ConfirmVO vo) {
	    log.info("/json_searchSeller.do...{}",vo);

	    List<ConfirmVO> vos = service.selectList_Seller(vo);

	    log.info("checking...{}",vos);
	     
	    return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_searchBuyer.do", method = RequestMethod.GET)
	public List<ConfirmVO> json_searchBuyer(ConfirmVO vo) {
	    log.info("/json_searchBuyer.do...{}",vo);

	    List<ConfirmVO> vos = service.selectList_Buyer(vo);

	    log.info("checking...{}",vos);
	     
	    return vos;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/C_SELECTLIST_SELLER_INFO.do", method = RequestMethod.GET)
	public ConfirmVO C_SELECTLIST_SELLER_INFO(ConfirmVO vo) {
	    log.info("/json_Deal_info.do...{}",vo);

	    ConfirmVO vo2 = service.C_SELECTLIST_SELLER_INFO(vo);

	    log.info("checking...{}",vo2);
	     
	    return vo2;
	}
	
	@ResponseBody
	@RequestMapping(value = "/C_SELECTLIST_BUYER_INFO.do", method = RequestMethod.GET)
	public ConfirmVO json_Deal_info(ConfirmVO vo) {
	    log.info("/json_Deal_info.do...{}",vo);

	    ConfirmVO vo2 = service.C_SELECTLIST_BUYER_INFO(vo);

	    log.info("checking...{}",vo2);
	     
	    return vo2;
	}
	
	@ResponseBody
	@RequestMapping(value = "/josn_deal_done.do", method = RequestMethod.GET)
	public List<ConfirmVO> josn_deal_done(ConfirmVO vo) {
	    log.info("/json_Deal_info.do...{}",vo);

	    List<ConfirmVO> vos = service.deal_done_check(vo);

	    log.info("checking...{}",vos);
	     
	    return vos;
	}
	
	
	
	

}
