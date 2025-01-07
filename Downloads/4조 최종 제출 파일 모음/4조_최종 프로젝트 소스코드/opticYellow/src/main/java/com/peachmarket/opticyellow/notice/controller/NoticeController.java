package com.peachmarket.opticyellow.notice.controller;

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
import com.peachmarket.opticyellow.notice.model.NoticeVO;
import com.peachmarket.opticyellow.notice.service.NoticeService;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {

	@Autowired
	NoticeService service;
	
	@Autowired
	HttpSession session;
	
	// 효림님 코드
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/noticeAdmin.do", method = RequestMethod.GET)
	public String noticeAdmin() {
		log.info("/noticeAdmin.do...");
		
		return "notice/noticeAdmin";
	} // end adminPage
//	
	
	@RequestMapping(value = "/n_selectAll.do", method = RequestMethod.GET)
	public String n_selectAll(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/n_selectAll.do");

		//전체 게시글 개수
		int listCnt = service.totalNotice();

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);		
		
		List<NoticeVO> vos = service.selectAll(pagination);
		log.info("{}",vos);
		model.addAttribute("vos", vos);

		return "notice/selectAll";
	}
	
	@RequestMapping(value = "/n_searchList.do", method = RequestMethod.GET)
	public String n_searchList(Model model
			, String searchWord
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
		
		List<NoticeVO> vos = service.searchList(searchWord,startList,endList);
		
		model.addAttribute("vos", vos);
		
		//전체 게시글 개수
		int listCnt = service.totalNotice();

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		
		return "notice/selectAll";
	}
	
	@RequestMapping(value = "/n_selectOne.do", method = RequestMethod.GET)
	public String n_selectOne(NoticeVO vo, Model model) {

		service.vcountUp(vo);
		
		
		NoticeVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		

		return "notice/selectOne";
	}
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/n_insert.do", method = RequestMethod.GET)
	public String n_insert() {
		log.info("/n_insert.do...");
		
		return "notice/insert";
	}
	
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/n_insertOK.do", method = RequestMethod.POST)
	public String n_insertOK(NoticeVO vo, Model model) throws IllegalStateException, IOException{
		log.info("/n_insertOK.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "공지사항이 등록되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/n_selectAll.do");

			return "alert";
			
		}else {
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "시스템 에러입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/n_insert.do");

			return "alert";
		}
		
	}
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/n_update.do", method = RequestMethod.GET)
	public String n_update(NoticeVO vo, Model model) {
		log.info("/n_update.do...{}", vo);

		NoticeVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "notice/update";
	}
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/n_updateOK.do", method = RequestMethod.POST)
	public String n_updateOK(NoticeVO vo, Model model) {
		log.info("/n_updateOK.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "공지사항이 수정되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/n_selectOne.do?n_num="+vo.getN_num());

			return "alert";
			
		}else {
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "시스템 에러입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/n_update.do?n_num="+vo.getN_num());

			return "alert";
		}
		
	}
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/n_deleteOK.do", method = RequestMethod.GET)
	public String n_deleteOK(NoticeVO vo, Model model) {
		log.info("/n_deleteOK.do...{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "공지사항이 삭제되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/n_selectAll.do");

			return "alert";
			
		}else {
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "시스템 에러입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/n_selectOne.do?n_num="+vo.getN_num());

			return "alert";
		}
		
	}
	

}
