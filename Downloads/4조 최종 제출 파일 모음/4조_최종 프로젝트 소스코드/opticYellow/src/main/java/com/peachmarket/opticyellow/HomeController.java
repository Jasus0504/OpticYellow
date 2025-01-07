package com.peachmarket.opticyellow;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peachmarket.opticyellow.game.model.GameVO;
import com.peachmarket.opticyellow.game.service.GameService;
import com.peachmarket.opticyellow.member.model.MemberVO;
import com.peachmarket.opticyellow.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	MemberService service;
	
	@Autowired
	GameService gameService;
	
	@RequestMapping(value = {"/","/home.do","/index.do"}, method = RequestMethod.GET)
	public String home(Model model) {
		log.info("Welcome home!");
		
		if(session.getAttribute("user_id") != null){
			MemberVO vo = new MemberVO();
			vo.setM_id((String)session.getAttribute("user_id"));
			
			MemberVO vo2 = service.selectRole(vo);
			session.setAttribute("role", vo2.getRole());
			session.setAttribute("m_img", vo2.getM_img());
		}
		
		List<GameVO> vos = gameService.selectAll();

		model.addAttribute("vos", vos);
		
		return "home";
	}
	
	@RequestMapping(value = "AuctionMainHome.do", method = RequestMethod.GET)
	public String MainHome(Model model) {
		log.info("Welcome AuctionMainHome!");
		
		return "AuctionMainHome";
	}
	
}
