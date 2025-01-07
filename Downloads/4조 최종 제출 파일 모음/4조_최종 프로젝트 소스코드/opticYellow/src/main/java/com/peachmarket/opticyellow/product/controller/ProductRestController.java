package com.peachmarket.opticyellow.product.controller;


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

import com.peachmarket.opticyellow.product.model.ProductVO;
import com.peachmarket.opticyellow.product.service.ProductService;

import lombok.extern.slf4j.Slf4j;
 
/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class ProductRestController {
	
	@Autowired
	ProductService service;
	
	@Autowired
	ServletContext sContext;

	
	@ResponseBody
	@RequestMapping(value = "/json_p_selectAll.do", method = RequestMethod.GET)
	public List<ProductVO> json_p_selectAll(Model model) {
		
		log.info("/json_p_selectAll.do..");
		List<ProductVO> vos =service.selectAll();
		
		log.info("/json_p_selectAlldo....{}",vos);
		
		return vos;
	}

	@ResponseBody
	@RequestMapping(value = "/json_p_selectOne.do", method = RequestMethod.GET)
	public ProductVO json_p_selectOne(ProductVO vo) {
		
		log.info("/json_p_selectOne.do...{}",vo);
		ProductVO vo2 =service.selectOne(vo);
		log.info("/json_p_selectOne.do...{}",vo2);
		
		return vo2;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_p_searchList.do", method = RequestMethod.GET)
	public List<ProductVO> p_searchList(Model model,
		String searchKey, String searchWord) {
		log.info("/b_searchList.do");
		log.info("searchKey:{}",searchKey);
		log.info("searchWord:{}",searchWord);
		
		List<ProductVO> vos = service.p_searchList(searchKey,searchWord);
		
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_view_select8.do", method = RequestMethod.GET)
	public List<ProductVO> json_view_select8() {

		
		List<ProductVO> vos = service.json_view_select8();
		
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_new_select8.do", method = RequestMethod.GET)
	public List<ProductVO> json_new_select8() {

		
		List<ProductVO> vos = service.json_new_select8();
		
		
		return vos;
	}
	

	

}
