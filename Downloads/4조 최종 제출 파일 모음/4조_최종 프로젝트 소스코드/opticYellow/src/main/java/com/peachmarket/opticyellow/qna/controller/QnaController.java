package com.peachmarket.opticyellow.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.notice.model.NoticeVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;
import com.peachmarket.opticyellow.qna.model.QnaVO;
import com.peachmarket.opticyellow.qna.service.QnaService;
import com.peachmarket.opticyellow.qnaanswer.model.QnaAnswerVO;
import com.peachmarket.opticyellow.qnaanswer.service.QnaAnswerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {

	@Autowired
	QnaService service;
	
	@Autowired
	QnaAnswerService answerService;
	
	@Autowired
	HttpSession session;
	
	// 효림님 코드
	@RequestMapping(value = "/qnaAdmin.do", method = RequestMethod.GET)
	public String qnaAdmin() {
		log.info("/qnaAdmin.do...");
		
		return "qna/qnaAdmin";
	} // end adminPage
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/qna_selectAll.do", method = RequestMethod.GET)
	public String qna_selectAll(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/qna_selectAll.do");

		String m_id = (String)session.getAttribute("user_id");
		
		//전체 게시글 개수
		int listCnt = service.totalQna(m_id);

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);		
		
		List<QnaVO> vos = service.selectAll(pagination,m_id);
		log.info("{}",vos);
		model.addAttribute("vos", vos);

		return "qna/selectAll";
	}
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/qna_selectAllAdmin.do", method = RequestMethod.GET)
	public String qna_selectAllAdmin(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/qna_selectAllAdmin.do");
		
		String m_id = (String)session.getAttribute("user_id");
		
		//전체 게시글 개수
		int listCnt = service.totalQna(m_id);

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);		
		
		List<QnaVO> vos = service.selectAllAdmin(pagination);
		log.info("{}",vos);
		model.addAttribute("vos", vos);
		
		return "qna/selectAllAdmin";
	}
	
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/qna_selectOne.do", method = RequestMethod.GET)
	public String qna_selectOne(QnaVO vo, Model model) {
		log.info("/qna_selectOne.do...{}", vo);
		
		QnaVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		QnaAnswerVO avo = new QnaAnswerVO();
		avo.setQ_num(vo.getQ_num());
		List<QnaAnswerVO> answer = answerService.selectAll(avo);
		log.info("{}",answer);
		
		model.addAttribute("answer", answer);
		

		return "qna/selectOne";
	}
	
	@RequestMapping(value = "/qna_selectOneAdmin.do", method = RequestMethod.GET)
	public String qna_selectOneAdmin(QnaVO vo, Model model) {
		log.info("/qna_selectOneAdmin.do...{}", vo);
		
		QnaVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		QnaAnswerVO avo = new QnaAnswerVO();
		avo.setQ_num(vo.getQ_num());
		List<QnaAnswerVO> answer = answerService.selectAll(avo);
		log.info("{}",answer);
		
		model.addAttribute("answer", answer);
		
		
		return "qna/selectOneAdmin";
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/qna_insert.do", method = RequestMethod.GET)
	public String qna_insert() {
		log.info("/qna_insert.do...");
		
		return "qna/insert";
	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/qna_insertOK.do", method = RequestMethod.POST)
	public String qna_insertOK(Model model, QnaVO vo) throws IllegalStateException, IOException{
		log.info("/qna_insertOK.do...{}", vo);
		
		vo.setQ_writer((String)session.getAttribute("user_id"));
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "1:1 문의가 등록되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/qna_selectAll.do");

			return "alert";
			
		}else {
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "시스템 에러입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/qna_insert.do");

			return "alert";
		}
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/qna_update.do", method = RequestMethod.GET)
	public String qna_update(QnaVO vo, Model model) {
		log.info("/qna_update.do...{}", vo);

		QnaVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "qna/update";
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/qna_updateOK.do", method = RequestMethod.POST)
	public String qna_updateOK(Model model, QnaVO vo) {
		log.info("/qna_updateOK.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "1:1 문의가 수정되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/qna_selectAll.do");

			return "alert";
			
		}else {
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "시스템 에러입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/qna_selectOne.do?num="+vo.getQ_num());

			return "alert";
		}
		
	}
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/qna_deleteOK.do", method = RequestMethod.GET)
	public String qna_deleteOK(Model model, QnaVO vo) {
		log.info("/qna_deleteOK.do...{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "1:1 문의가 삭제되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/qna_selectAll.do");

			return "alert";
			
		}else {
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "시스템 에러입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/qna_selectOne.do?num="+vo.getQ_num());

			return "alert";
		}
		
	}
	

}
