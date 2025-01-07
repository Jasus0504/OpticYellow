package com.peachmarket.opticyellow.allcommu.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.peachmarket.opticyellow.allcmt.service.AllCmtService;
import com.peachmarket.opticyellow.allcommu.model.AllCommuLikeVO;
import com.peachmarket.opticyellow.allcommu.model.AllCommuVO;
import com.peachmarket.opticyellow.allcommu.service.AllCommuService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AllCommuController {
	
	@Autowired
	AllCommuService service;

	@Autowired
	AllCmtService cmtService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext sContext;
	
	@RequestMapping(value = "/commuList.do", method = RequestMethod.GET)
	public String commuList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/commuList.do...");
		
		//전체 게시글 개수
		int listCnt = service.totalCommu();

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);		
		
		return "allcommu/commuList";
	} // end commuList......

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/commuInsert.do", method = RequestMethod.GET)
	public String commuInsert() {
		log.info("/commuInsert.do...");
		
		return "allcommu/insert";
	} // end commuInsert......

	@RequestMapping(value = "/commuInsertOK.do", method = RequestMethod.POST)
	public String commuInsertOK(AllCommuVO vo) {
		log.info("/commuInsertOK.do...{}",vo);
		
		vo.setComm_id((String)session.getAttribute("user_id"));
		
		int result = service.commuInsert(vo);
		log.info("{}",result);
		
		return "redirect:commuList.do";
	} // end commInsertOK......

	@RequestMapping(value = "/commuOne.do", method = RequestMethod.GET)
	public String commuOne(AllCommuVO vo, Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/commuOne.do...{}",vo);

		service.vcountUp(vo);
		
		AllCommuVO vo2 = service.commuOne(vo);
		log.info("vo2를 찍는것입니다.{}",vo2);
		
		//전체 게시글 개수
		int listCnt = cmtService.totalCmt(vo);

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.setListSize(5);
		pagination.pageInfo(page, range, listCnt);
		
		// 댓글 시작번호 ex) 1, 6, 11, 16 ...
		if (page == 1) {
			int startList = 1;
			int endList = startList + 4;
			pagination.setStartList(startList);
			pagination.setEndList(endList);
		} else {
			int startList = (5 * (page - 1)) + 1;
			int endList = startList + 4;
			pagination.setStartList(startList);
			pagination.setEndList(endList);
		}
		log.info("{}",pagination);
		model.addAttribute("pagination", pagination);
		
		model.addAttribute("vo2", vo2);
		
		return "allcommu/commuOne";
	} // end commuOne......

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/commu_update.do", method = RequestMethod.GET)
	public String commu_update(AllCommuVO vo, Model model) {
		log.info("/commu_update.do...{}",vo);
		
		AllCommuVO vo2 = service.commuOne(vo);
		log.info("{}",vo2);
		
		model.addAttribute("vo2", vo2);
		
		return "allcommu/update";
	} // end commu_update......

	@RequestMapping(value = "/commuUpdateOK.do", method = RequestMethod.POST)
	public String commuUpdateOK(AllCommuVO vo, Model model) {
		log.info("/commuUpdateOK.do...{}",vo);
		
		int result = service.commuUpdate(vo);
		
		String msg = "수정되었습니다.";	
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/commuOne.do?comm_num="+vo.getComm_num());
		
		return "alert";
	} // end commuUpdateOK......

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/commuDeleteOK.do", method = RequestMethod.GET)
	public String commuDeleteOK(AllCommuVO vo, Model model) {
		log.info("/commuDeleteOK.do...{}",vo);
		
		int result = service.commuDelete(vo);
		
		String msg = "삭제되었습니다.";	
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/commuList.do");
		
		return "alert";
	} // end commuDeleteOK......

}
