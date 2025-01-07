package com.peachmarket.opticyellow.qnaanswer.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peachmarket.opticyellow.qnaanswer.model.QnaAnswerVO;
import com.peachmarket.opticyellow.qnaanswer.service.QnaAnswerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaAnswerController {

	@Autowired
	QnaAnswerService answerService;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping(value = "/answer_insertOK.do", method = RequestMethod.POST)
	public String answer_insertOK(Model model, QnaAnswerVO vo) throws IllegalStateException, IOException{
		log.info("/엔써_insertOK.do...{}", vo);
		
		int result = answerService.insert(vo);
		
		log.info("result...{}", result);
		
		// 얼럿창 생성 후 아이디찾기 페이지로 이동
		String msg = "답변이 등록되었습니다.";
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/qna_selectOneAdmin.do?q_num="+vo.getQ_num());

		return "alert";
	}

	@RequestMapping(value = "/answer_updateOK.do", method = RequestMethod.POST)
	public String answer_updateOK(Model model, QnaAnswerVO vo) {
		log.info("/answer_updateOK.do...{}", vo);
		
		int result = answerService.update(vo);
		log.info("result...{}", result);
		
		// 얼럿창 생성 후 아이디찾기 페이지로 이동
		String msg = "답변이 수정되었습니다.";
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/qna_selectOneAdmin.do?q_num="+vo.getQ_num());

		return "alert";
		
	}
	
	@RequestMapping(value = "/answer_deleteOK.do", method = RequestMethod.GET)
	public String answer_deleteOK(Model model, QnaAnswerVO vo) {
		log.info("/answer_deleteOK.do...{}", vo);
		
		int result = answerService.delete(vo);
		log.info("result...{}", result);
		
		// 얼럿창 생성 후 아이디찾기 페이지로 이동
		String msg = "답변이 삭제되었습니다.";
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/qna_selectOneAdmin.do?q_num="+vo.getQ_num());

		return "alert";
		
	}
	

}
