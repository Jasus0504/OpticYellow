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
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.product.model.ProductVO;

import lombok.extern.slf4j.Slf4j;

 
/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class ConfirmController {
	
	@Autowired
	ConfirmService service;
	
	@Autowired
	ServletContext sContext;
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/confirm_menu.do", method = RequestMethod.GET)
	public String confirm_menu(ConfirmVO vo) {
		
		log.info("/confirm_menu.do...{}",vo);
		
		
		return "confirm/confirm_menu";
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/confirm_sell_menu.do", method = RequestMethod.GET)
	public String confirm_sell_menu(ConfirmVO vo) {
		
		log.info("/confirm_sell_menu.do...{}",vo);
		
		
		return "confirm/sell_list";
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/confirm_buy_menu.do", method = RequestMethod.GET)
	public String confirm_buy_menu(ConfirmVO vo) {
		
		log.info("/confirm_buy_menu.do...{}",vo);
		
		
		return "confirm/buy_list";
	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/cs_selectOne.do", method = RequestMethod.GET)
	public String cs_selectOne() {
		
		log.info("/confirm_selectOne.do...{}");
		
		
		return "confirm/s_selectOne";
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/cb_selectOne.do", method = RequestMethod.GET)
	public String cb_selectOne() {
		
		log.info("/confirm_selectOne.do...{}");
		
		
		return "confirm/b_selectOne";
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/final_sell_decision.do", method = RequestMethod.GET)
	public String final_sell_decision() {
		
		log.info("/confirm_selectOne.do...{}");
		
		
		return "confirm/final_sell_decision";
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/final_buy_decision.do", method = RequestMethod.GET)
	public String final_buy_decision() {
		
		log.info("/confirm_selectOne.do...{}");
		
		
		return "confirm/final_buy_decision";
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/deal_done.do", method = RequestMethod.GET)
	public String deal_done() {
		
		log.info("/deal_done.do...{}");
		
		
		return "confirm/deal_done";
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/deal_done_Ok.do", method = RequestMethod.GET)
	public String deal_done_Ok(ConfirmVO vo) {
		
		log.info("/deal_done_Ok.do...{}",vo);
		
		service.deal_done_Ok(vo);
		
		return "AuctionMainHome";
	}

}
