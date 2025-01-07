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

import com.peachmarket.opticyellow.report.model.ReportVO;
import com.peachmarket.opticyellow.report.service.ReportService;

import lombok.extern.slf4j.Slf4j;
 
/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class ReportRestController {
	
	@Autowired
	ReportService service;
	
	@Autowired
	ServletContext sContext;

	@ResponseBody
	@RequestMapping(value = "/json_r_mylist.do", method = RequestMethod.GET)
	public List<ReportVO> json_r_myList(ReportVO vo) {
			
			
			List<ReportVO> vos = service.r_mylist(vo);
		
		return vos; 
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/json_r_selectAll.do", method = RequestMethod.GET)
	public List<ReportVO> json_r_selectAll(ReportVO vo) {
			
			
			List<ReportVO> vos = service.r_selectAll(vo);
		
		return vos; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_r_selectOne.do", method = RequestMethod.GET)
	public ReportVO json_selectOne(ReportVO vo) {
			
			
			ReportVO vo2 = service.r_selectOne(vo);
		
		return vo2; 
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/json_r_unread.do", method = RequestMethod.GET)
	public List<ReportVO> json_r_unread() {
			
			
	List<ReportVO> vos = service.unread();
			
				
		return vos; 
	}
	
	
	
	
	
	
	
	
	



}
