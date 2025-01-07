package com.peachmarket.opticyellow.report.controller;


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

import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.report.model.ReportVO;
import com.peachmarket.opticyellow.report.service.ReportService;

import lombok.extern.slf4j.Slf4j;
 
/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class ReportController {
	
	@Autowired
	ReportService service;
	
	@Autowired
	ServletContext sContext;

	
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/r_insert.do", method = RequestMethod.GET)
	public String r_insert(ReportVO vo) {
		
		
		return "report/insert";
		
		
	}@RequestMapping(value = "/adv_r_insert.do", method = RequestMethod.GET)
		public String adv_r_insert(ReportVO vo) {
			
			
			return "report/adv_insert";	
		
	}@RequestMapping(value = "/r_insertOK.do", method = RequestMethod.POST)
	public String r_insertOK(ReportVO vo) {
		
		log.info("Reportchecking....{}",vo);
		
		service.r_insert(vo);
		
		return "AuctionMainHome";
	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/r_mylist.do", method = RequestMethod.GET)
	public String r_mylist(ReportVO vo) {
		
		
		
		
		return "report/mylist";
	}
	
	@RequestMapping(value = "/r_selectOne.do", method = RequestMethod.GET)
	public String r_selcetOne(ReportVO vo) {
		
		
		
		
		return "report/selectOne";
	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/r_selectAll.do", method = RequestMethod.GET)
	public String r_selectAll() {
		
		
		
		
		return "report/selectAll";
	}
	
	@RequestMapping(value = "/r_adv_selectOne.do", method = RequestMethod.GET)
	public String r_adv_selectOne() {
		
		
		
		
		return "report/adv_selectOne";
	}
	

	@RequestMapping(value = "/adv_r_insertOK.do", method = RequestMethod.POST)
	public String adv_r_insertOK(ReportVO vo) {
		
		log.info("Reportchecking....{}",vo);
		
		service.adv_r_insert(vo);
		
		
		return "report/closeWindow";
	}
	
	
	



}
