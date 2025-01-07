package com.peachmarket.opticyellow.game.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peachmarket.opticyellow.facman.model.FacManVO;
import com.peachmarket.opticyellow.game.model.GameVO;
import com.peachmarket.opticyellow.game.service.GameService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.join.model.JoinVO;
import com.peachmarket.opticyellow.join.service.JoinService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GameController {

	@Autowired
	GameService service;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	JoinService joinService;

	@Autowired
	ServletContext sContext;
	
	// 민서님 코드
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/game_list.do", method = RequestMethod.GET)
	public String game_list(Model model, GameVO vo) {
		log.info("/game_list.do...{}", vo);
		
		session.setAttribute("user_id", vo.getG_joiner());
		
		// 오늘 날짜 설정
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    String today = dateFormat.format(new Date());
	    vo.setG_start_dt(today);
	    vo.setG_end_dt(today);
		
	    // 해당 사용자의 신청 내역을 조회합니다.
	    List<GameVO> vos = service.gamelist(vo);
	    
	    model.addAttribute("vos", vos);

	    return "member/game_court/game_List";
		
	}
	
	// 효림님 코드
	@RequestMapping(value = "/g_selectAll.do", method = RequestMethod.GET)
	public String g_selectAll(Model model) {
		log.info("/g_selectAll.do");

		List<GameVO> vos = service.selectAll();

		model.addAttribute("vos", vos);

		return "game/selectAll";
	}
	

//날짜 필터
	@RequestMapping(value = "/g_searchList.do", method = RequestMethod.GET)
	public String g_searchList(Model model, String searchKey, String searchWord) {
		log.info("/g_searchList.do");

		List<GameVO> vos = service.searchList(searchKey, searchWord);
		for (GameVO x : vos) {
			log.info(x.toString());
		}

		model.addAttribute("vos", vos);

		return "game/selectAll";
	}

//나머지 필터
	@RequestMapping(value = "/g_searchRestList.do", method = RequestMethod.GET)
	public String searchByOptions(Model model, String region, String subRegion, Double ntrp,
			String gender,String open) {
		List<GameVO> vos = service.searchByOptions("%"+region+"%", "%"+subRegion+"%", ntrp, gender, open);
		for (GameVO x : vos) {
			log.info(x.toString());
		}

		model.addAttribute("vos", vos);

		return "game/selectAll";
	}


	@RequestMapping(value = "/g_selectOne.do", method = RequestMethod.GET)
	public String g_selectOne(GameVO vo, Model model,  HttpSession session) {
		log.info("/g_selectOne.do...{}", vo);

		GameVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);

		JoinVO jvo = new JoinVO();
		jvo.setG_num(vo2.getG_num());
		
		//비회원이라 user_id가 없으면 String null로 받아오게
		   String user_id = (String) session.getAttribute("user_id");
		    if (user_id == null) {
		        user_id = "null";
		    }
		
		List<JoinVO> joins = joinService.searchList(jvo, user_id);

		model.addAttribute("joins", joins);

		return "game/selectOne";
	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/g_update.do", method = RequestMethod.GET)
	public String g_update(GameVO vo, Model model) {
		log.info("/g_update.do...{}", vo);

		GameVO vo2 = service.selectOne(vo);
		log.info("vo2:{}", vo2);

		model.addAttribute("vo2", vo2);

		return "game/update";
	}
	
	@RequestMapping(value = "/g_updateOK.do", method = RequestMethod.POST)
	public String g_updateOK(GameVO vo) throws IllegalStateException, IOException {
		log.info("/g_updateOK.do...{}", vo);

		log.info("{}", vo);

		int result = service.update(vo);
		log.info("result:{}", result);

		if (result == 1) {
			return "redirect:g_selectOne.do?g_num=" + vo.getG_num();
		} else {
			return "redirect:g_update.do?g_num=" + vo.getG_num();
		}

	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/g_deleteOK.do", method = RequestMethod.GET)
	public String g_deleteOK(GameVO vo) {
		log.info("/g_deleteOK.do...{}", vo);

		int result = service.delete(vo);
		log.info("result:{}", result);

		if (result == 1) {
			return "redirect:g_selectAll.do";
		} else {
			return "redirect:g_selectOne.do?g_num=" + vo.getG_num();
		}

	}
	
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/g_insert.do", method = RequestMethod.GET)
	public String g_insert() {
		log.info("/g_insert.do...");

		return "game/insert";
	}
	
	@RequestMapping(value = "/g_insertOK.do", method = RequestMethod.POST)
	public String g_insertOK(GameVO vo) throws IllegalStateException, IOException {
	    log.info("/g_insertOK.do...{}", vo);

	    // fac_name으로 facility 얻어오기
	    FacManVO vo2 = service.getFacility(vo.getFac_name());

	    if (vo2 != null) {
	        vo.setFac_id(vo2.getFac_id());
	        vo.setG_address(vo2.getAddress());
	        log.info("controller...{}", vo);

	        int result = service.insert(vo);
	        log.info("result:{}", result);

	        if (result == 1) {
	            return "redirect:g_selectAll.do";
	        }
	    } else {
	        // 시설이 없는 경우 처리
	        vo.setFac_id(null);
	        vo.setG_address(null);
	        log.info("controller...{}", vo);

	        int result = service.insert(vo);
	        log.info("result:{}", result);

	        if (result == 1) {
	            return "redirect:g_selectAll.do";
	        }
	    }

	    return "redirect:g_insert.do";
	}
}



