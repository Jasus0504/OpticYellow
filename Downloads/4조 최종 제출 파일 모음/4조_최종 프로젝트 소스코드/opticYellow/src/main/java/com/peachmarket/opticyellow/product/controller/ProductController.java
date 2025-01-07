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
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@Autowired
	ServletContext sContext;

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/p_insert.do", method = RequestMethod.GET)
	public String a_insert() {
			
		
		return "auction/insert";
	}	
	
	@RequestMapping(value = "/p_insertOK.do", method = RequestMethod.POST)
	public String p_insertOK(ProductVO vo)throws IllegalStateException, IOException{
		log.info("/a_insertOK.do...{}", vo);
		
		String getOriginalFilename1 = vo.getMultipartFile1().getOriginalFilename();
		int fileNameLength1 = vo.getMultipartFile1().getOriginalFilename().length();
		log.info("getOriginalFilename1 : {}", getOriginalFilename1);
		log.info("fileNameLength1 : {}", fileNameLength1);

		if (getOriginalFilename1.length() == 0) {
			vo.setP_pic1("f_default.png");
		} else {
			vo.setP_pic1(getOriginalFilename1);
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			File f1 = new File(realPath + File.separator + vo.getP_pic1());
			vo.getMultipartFile1().transferTo(f1);
			
		} // end else
		
		String getOriginalFilename2 = vo.getMultipartFile2().getOriginalFilename();
		int fileNameLength2 = vo.getMultipartFile2().getOriginalFilename().length();
		log.info("getOriginalFilename2 : {}", getOriginalFilename2);
		log.info("fileNameLength2 : {}", fileNameLength2);

		if (getOriginalFilename2.length() == 0) {
			vo.setP_pic2("");
		} else {
			vo.setP_pic2(getOriginalFilename2);
			String realPath = sContext.getRealPath("resources/uploadimg");

			File f2 = new File(realPath + File.separator + vo.getP_pic2());
			vo.getMultipartFile2().transferTo(f2);
			
		} // end else
		
		String getOriginalFilename3 = vo.getMultipartFile3().getOriginalFilename();
		int fileNameLength3 = vo.getMultipartFile3().getOriginalFilename().length();
		log.info("getOriginalFilename3 : {}", getOriginalFilename3);
		log.info("fileNameLength3 : {}", fileNameLength3);

		if (getOriginalFilename3.length() == 0) {
			vo.setP_pic3("");
		} else {
			vo.setP_pic3(getOriginalFilename3);
			String realPath = sContext.getRealPath("resources/uploadimg");

			File f3 = new File(realPath + File.separator + vo.getP_pic3());
			vo.getMultipartFile3().transferTo(f3);
		}
		log.info("{}", vo);
		
		
		vo.setDead_line(vo.getDead_line().replace("T", " "));
		log.info("deadline....{}",vo.getDead_line());
		int result = service.p_insert(vo);
		log.info("result:{}", result);

		if (result == 1) {
			return "redirect:AuctionMainHome.do";
		} else {
			return "redirect:home.do";
		}

	}
	
	@RequestMapping(value = "/adv_p_selectAll.do", method = RequestMethod.GET)
	public String adv_p_selectAll(Model model) {
		log.info("/p_selectAll.do..");
		
		return "auction/adm_selectAll";
	}
	
	@RequestMapping(value = "/mv_p_selectAll.do", method = RequestMethod.GET)
	public String mv_p_selectAll(Model model) {
		
		log.info("/p_selectAll.do");
		
		return "auction/mv_selectAll";
	}
	

	
	@RequestMapping(value = "/p_selectOne.do", method = RequestMethod.GET)
	public String p_selectOne(ProductVO vo) {
		
		log.info("/p_selectOne.do...{}",vo);
		
		service.vcountUp(vo);
		
		return "auction/selectOne";
	}
	
	@RequestMapping(value = "/p_update.do", method = RequestMethod.GET)
	public String p_update(ProductVO vo) {
		
		log.info("/p_update.do...{}");
		
		
		return "auction/update";
	}
	
	@RequestMapping(value = "/p_updateOK.do", method = RequestMethod.POST)
	public String p_updateOK(ProductVO vo) throws IllegalStateException, IOException{
		
		log.info("/p_updateOK.do...{}",vo);
		
		String getOriginalFilename1 = vo.getMultipartFile1().getOriginalFilename();
		int fileNameLength1 = vo.getMultipartFile1().getOriginalFilename().length();
		log.info("getOriginalFilename1 : {}", getOriginalFilename1);
		log.info("fileNameLength1 : {}", fileNameLength1);

		if (getOriginalFilename1.length() == 0) {
			vo.setP_pic1("f_default.png");
		} else {
			vo.setP_pic1(getOriginalFilename1);
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			File f1 = new File(realPath + File.separator + vo.getP_pic1());
			vo.getMultipartFile1().transferTo(f1);
			
		} // end else
		
		String getOriginalFilename2 = vo.getMultipartFile2().getOriginalFilename();
		int fileNameLength2 = vo.getMultipartFile2().getOriginalFilename().length();
		log.info("getOriginalFilename2 : {}", getOriginalFilename2);
		log.info("fileNameLength2 : {}", fileNameLength2);

		if (getOriginalFilename2.length() == 0) {
			vo.setP_pic2("");
		} else {
			vo.setP_pic2(getOriginalFilename2);
			String realPath = sContext.getRealPath("resources/uploadimg");

			File f2 = new File(realPath + File.separator + vo.getP_pic2());
			vo.getMultipartFile2().transferTo(f2);
			
		} // end else
		
		String getOriginalFilename3 = vo.getMultipartFile3().getOriginalFilename();
		int fileNameLength3 = vo.getMultipartFile3().getOriginalFilename().length();
		log.info("getOriginalFilename3 : {}", getOriginalFilename3);
		log.info("fileNameLength3 : {}", fileNameLength3);

		if (getOriginalFilename3.length() == 0) {
			vo.setP_pic3("");
		} else {
			vo.setP_pic3(getOriginalFilename3);
			String realPath = sContext.getRealPath("resources/uploadimg");

			File f3 = new File(realPath + File.separator + vo.getP_pic3());
			vo.getMultipartFile3().transferTo(f3);
		}
		
		service.p_update(vo);
		
		return "redirect:p_selectOne.do?p_num=" + vo.getP_num();
	}
	
	@RequestMapping(value = "/p_deleteOK.do", method = RequestMethod.GET)
	public String p_deleteOK(ProductVO vo) {
		
		log.info("/p_finalOK.do...{}",vo);
		service.p_delete(vo);
		
		return "AuctionMainHome";
	}

	
	//물품 디비에 seller granted에 Ok 입력 
	@RequestMapping(value = "/s_p_finalOK.do", method = RequestMethod.GET)
	public String s_p_finalOK(ProductVO vo) {
		
		log.info("/p_finalOK.do...{}",vo);
		
		service.s_p_final(vo);
		
		
		return "AuctionMainHome";
	}
	
	@RequestMapping(value = "/b_p_finalOK.do", method = RequestMethod.GET)
	public String b_p_finalOK(ProductVO vo) {
		
		log.info("/b_finalOK.do...{}",vo);
		
		service.b_p_final(vo);
		
		
		return "AuctionMainHome";
	}
	
	@RequestMapping(value = "/p_searchList.do", method = RequestMethod.GET)
	public String p_searchList() {
		
		
		return "auction/mv_selectAll";
	}
	
	@RequestMapping(value = "/view_selectAll.do", method = RequestMethod.GET)
	public String view_selectAll() {
		
		
		return "auction/view_selectAll";
	}
	

	@RequestMapping(value = "/p_introduce.do", method = RequestMethod.GET)
	public String auction_buy_list() {
		log.info("/p_introduce.do...{}");

	    return "AuctionRest/Introduce";
		
	}
	
	
	
	
	
	



}
