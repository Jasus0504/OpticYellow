package com.peachmarket.opticyellow.join.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peachmarket.opticyellow.game.model.GameVO;
import com.peachmarket.opticyellow.game.service.GameService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.join.model.JoinVO;
import com.peachmarket.opticyellow.join.service.JoinService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JoinController {

	@Autowired
	JoinService joinService;

	@Autowired
	GameService service;

	// 효림님 코드
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/j_updateOK.do", method = RequestMethod.GET)
	public String j_updateOK(JoinVO vo) {
		log.info("/j_updateOK.do...{}", vo);

		int result = joinService.update(vo);
		log.info("result...{}", result);

		return "redirect:g_selectOne.do?g_num=" + vo.getG_num();

	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/j_deleteOK.do", method = RequestMethod.GET)
	public String j_deleteOK(JoinVO vo) {
		log.info("/j_deleteOK.do...{}", vo);

		int result = joinService.delete(vo);
		log.info("result...{}", result);

		return "redirect:g_selectOne.do?g_num=" + vo.getG_num();

	}
//	@RequestMapping(value = "/j_insertOK.do", method = RequestMethod.GET)
//	public String j_insertOK(JoinVO vo, GameVO vo2) {
//		
//		int joinInsert= joinService.insert(vo);
//	    
//	    // game 테이블에 대한 UPDATE 작업 수행
//	    int gameUpdate = service.decreaseRemaining(vo2);
//	    
//	    
//		
//		
//		return "redirect:g_selectOne.do?g_num="+vo.getG_num();
//		//결제하기 페이지로 이동
//		
//	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/j_insertOK.do", method = RequestMethod.GET)
	public String j_insertOK(JoinVO vo, GameVO vo2, Model model) {
		String userId = vo.getG_joiner();
		int gameNum = vo.getG_num();
		log.info("{}", vo);

		// Check if the user has already applied
		boolean hasApplied = joinService.hasUserApplied(userId, gameNum);
		if (hasApplied) {
			// User has already applied for the game, handle the error condition
			return "redirect:/g_selectOne.do?g_num=" + vo.getG_num() + "&error=already_applied";
		} else {
			// Proceed with the application insertion
			int joinInsert = joinService.insert(vo);
			int gameUpdate = service.decreaseRemaining(vo2);
		}

		return "redirect:/g_selectOne.do?g_num=" + vo.getG_num();
	}

}
