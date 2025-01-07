package com.peachmarket.opticyellow.bid.controller;


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
import com.peachmarket.opticyellow.bid.service.BidService;
import com.peachmarket.opticyellow.product.model.ProductVO;
import com.peachmarket.opticyellow.product.service.ProductService;

import lombok.extern.slf4j.Slf4j;

 
/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class BidRestController {
	
	@Autowired
	BidService service;
	
	@Autowired
	ServletContext sContext;
	
	@ResponseBody
	@RequestMapping(value = "/json_b_selectAll.do", method = RequestMethod.GET)
	public List<BidVO> json_b_selectAll() {
		
		List<BidVO> vos = service.b_selectAll();
		
		
		return vos;
	}
	
	//현재 최고가
	@ResponseBody
	@RequestMapping(value = "/json_b_high.do", method = RequestMethod.GET)
	public BidVO json_a_high(BidVO vo) {
	    log.info("/json_l_high.do");

	    BidVO vo2 = service.selectone_High(vo);

	    log.info("checking...{}",vo2);
	     
	    return vo2;
	}
	
	//경매 종료후 비교
	@ResponseBody
	@RequestMapping(value = "/json_fb_high.do", method = RequestMethod.GET)
	public List<BidVO> json_fb_high() {
	    log.info("/json_fb_high.do");

	    List<BidVO> vos = service.selectList_FinalHigh();

	    log.info("checking...{}",vos);
	    
	    return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_b_buy_list", method = RequestMethod.GET)
	public List<BidVO> json_b_buylist(BidVO vo) {
		
		List<BidVO> vos = service.b_buy_list(vo);
		
		
		return vos;
				
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_b_sold_list.do", method = RequestMethod.GET)
	public List<BidVO> json_b_sold_list(BidVO vo) {
		
		List<BidVO> vos = service.b_sold_list(vo);
		
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_b_bought_list.do", method = RequestMethod.GET)
	public List<BidVO> json_b_bought_list(BidVO vo) {
		
		List<BidVO> vos = service.b_bought_list(vo);
		
		
		return vos;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/json_b_sell_list", method = RequestMethod.GET)
	public List<BidVO> json_b_selllist(BidVO vo) {
		
		List<BidVO> vos = service.b_sell_list(vo);
		
		
		return vos;
	}
	
	
	

}
