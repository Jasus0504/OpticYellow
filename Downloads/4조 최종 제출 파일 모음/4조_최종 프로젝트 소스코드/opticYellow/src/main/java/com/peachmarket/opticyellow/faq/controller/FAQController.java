package com.peachmarket.opticyellow.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.peachmarket.opticyellow.faq.model.FAQVO;
import com.peachmarket.opticyellow.faq.service.FAQService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FAQController {

	@Autowired
	FAQService service;
	
	@Autowired
	HttpSession session;
	
	// 효림님 코드
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/FAQadmin.do", method = RequestMethod.GET)
	public String FAQadmin(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/FAQadmin.do...");
		
		//전체 게시글 개수
		int listCnt = service.totalFaq();

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);		
		
		List<FAQVO> vos = service.selectAll(pagination);

		model.addAttribute("vos", vos);
		
		return "FAQ/FAQadmin";
	} // end adminPage
	
	
	@RequestMapping(value = "/q_selectAll.do", method = RequestMethod.GET)
	public String q_selectAll(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/q_selectAll.do");

		//전체 게시글 개수
		int listCnt = service.totalFaq();

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);		
		
		List<FAQVO> vos = service.selectAll(pagination);

		model.addAttribute("vos", vos);

		return "FAQ/selectAll";
	}
	
	@RequestMapping(value = "/q_searchList.do", method = RequestMethod.GET)
	public String q_searchList(Model model,
			String searchKey, String searchWord
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
	
		int startList = 0;
		int endList = 0;
		
		if (page == 1) {
			startList = 1;
			endList = startList + 9;
		} else {
			startList = (10 * (page - 1)) + 1;
			endList = startList + 9;
		}		
		
		log.info("startList,endList:{},{}",startList,endList);
		
		List<FAQVO> vos = service.searchList(searchKey,searchWord,startList,endList);
		
		model.addAttribute("vos", vos);
		
		//전체 게시글 개수
		int listCnt = service.totalFaq();

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		
		return "FAQ/selectAll";
	}
	
	@RequestMapping(value = "/q_selectOne.do", method = RequestMethod.GET)
	public String q_selectOne(FAQVO vo, Model model) {
		log.info("/q_selectOne.do...{}", vo);

		service.vcountUp(vo);
		
		FAQVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		

		return "FAQ/selectOne";
	}
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/q_insert.do", method = RequestMethod.GET)
	public String q_insert() {
		log.info("/q_insert.do...");
		
		return "FAQ/insert";
	}
	
	
	@RequestMapping(value = "/q_insertOK.do", method = RequestMethod.POST)
	public String q_insertOK(FAQVO vo, Model model) throws IllegalStateException, IOException{
		log.info("/q_insertOK.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			String msg = "FAQ 게시글이 등록되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/q_selectAll.do");

			return "alert";	
			
		}else {
			String msg = "시스템 에러입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/q_insert.do");

			return "alert";	
		}
		
	}
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/q_update.do", method = RequestMethod.GET)
	public String q_update(FAQVO vo, Model model) {
		log.info("/q_update.do...{}", vo);

		FAQVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "FAQ/update";
	}
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/q_updateOK.do", method = RequestMethod.POST)
	public String q_updateOK(FAQVO vo, Model model) {
		log.info("/q_updateOK.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {

			String msg = "수정되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/q_selectOne.do?f_num="+vo.getF_num());

			return "alert";			
		} else {
			String msg = "시스템 에러입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/q_update.do?f_num="+vo.getF_num());
			
			return "alert";
		}
		
	}
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/q_deleteOK.do", method = RequestMethod.GET)
	public String q_deleteOK(FAQVO vo, Model model) {
		log.info("/q_deleteOK.do...{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			String msg = "삭제되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/q_selectAll.do");

			return "alert";	
			
		}else {
			String msg = "시스템 에러입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/q_selectOne.do?f_num="+vo.getF_num());
			
			return "alert";
			
		}
		
	}
	

}
