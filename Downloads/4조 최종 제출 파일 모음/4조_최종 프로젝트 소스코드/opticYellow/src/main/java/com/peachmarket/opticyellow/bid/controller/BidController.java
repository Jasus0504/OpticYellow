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
import com.peachmarket.opticyellow.confirm.model.ConfirmVO;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.product.model.ProductVO;
import com.peachmarket.opticyellow.product.service.ProductService;

import lombok.extern.slf4j.Slf4j;

 
/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class BidController {
	
	@Autowired
	BidService service;
	
	@Autowired
	ServletContext sContext;
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/b_selectAll.do", method = RequestMethod.GET)
	public String b_selectAll(Model model) {
		log.info("/b_selectAll.do..");
		
		return "bid/b_selectAll";
	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/b_insertOK.do", method = RequestMethod.POST)
	public String b_insert(BidVO vo) {
		
		service.b_insert(vo);
		
		return "redirect:p_selectOne.do?p_num=" + vo.getP_num();
	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/b_sell_list.do", method = RequestMethod.GET)
	public String b_selllist() {
		
		log.info("/b_sell_list.do...{}");
		
		
		return "bid/sell_list";
	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/b_buy_list.do", method = RequestMethod.GET)
	public String b_buylist() {
		
		log.info("/buy_list.do...{}");
		
		
		return "bid/buy_list";
	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/b_bought_list.do", method = RequestMethod.GET)
	public String b_bought_list() {
		
		log.info("/buy_list.do...{}");
		
		
		return "bid/bought_list";
	}
	
	
	
	

}
