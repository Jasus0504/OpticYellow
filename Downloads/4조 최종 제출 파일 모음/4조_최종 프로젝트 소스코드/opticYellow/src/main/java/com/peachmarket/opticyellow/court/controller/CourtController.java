package com.peachmarket.opticyellow.court.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.peachmarket.opticyellow.common.PaginationVO;
import com.peachmarket.opticyellow.court.model.CourtVO;
import com.peachmarket.opticyellow.court.model.FacManwithCourtVO;
import com.peachmarket.opticyellow.court.service.CourtService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CourtController {

	@Autowired
	CourtService service;

	@Autowired
	HttpSession session;

	// 민서님 코드
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/court_list.do", method = RequestMethod.GET)
	public String court_list(Model model, CourtVO vo) {
		log.info("/court_list.do...{}", vo);

		session.setAttribute("user_id", vo.getUser_id());

		// 오늘 날짜 설정
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String today = dateFormat.format(new Date());
		vo.setStart_time(today);
		vo.setEnd_time(today);

		// 해당 사용자의 신청 내역을 조회합니다.
		List<CourtVO> vos = service.courtList(vo);

		model.addAttribute("vos", vos);

		return "member/game_court/court_List";

	}

	// 병엽님 코드
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/court_reserve.do", method = RequestMethod.GET)
	public String court_reserve(CourtVO vo) {
		log.info("/court_reserve.do...{}", vo);

		return "court_reserve/court_reserve";
	}
	
	@RequestMapping(value = "/court_reserveOK.do", method = RequestMethod.POST)
	public String court_reserveOK(Model model, CourtVO vo) {
		log.info("/court_reserveOK.do...{}", vo);

		int result = service.c_reserve(vo);

		if (result == 1) {
			model.addAttribute("user_id", vo.getUser_id());
			return "court_reserve/reserve_success";
		} else {
			return "court_reserve/reserve_failed";
		}
	}

	@RequestMapping(value = "/court_selectAll.do", method = RequestMethod.GET)
	public String court_selectAll(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/court_selectAll.do...");

		// 테니스장 목록 개수
		int listCnt = service.courtAllCnt();

		// Pagination 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);

		return "court_reserve/courtSelectAll";
	}
	
	@RequestMapping(value = "/courtSelectOne.do", method = RequestMethod.GET)
	public String courtSelectOne(Model model, FacManwithCourtVO vo) {
		log.info("/courtSelectOne.do...{}", vo);

		FacManwithCourtVO vo2 = service.fac_selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "court_reserve/courtSelectOne";
	}

	@RequestMapping(value = "/court_running.do", method = RequestMethod.GET)
	public String court_running(Model model, FacManwithCourtVO vo) {
		log.info("/court_running.do...{}", vo);
		
		return "court_reserve/court_running";
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/c_reserveDeleteOK.do", method = RequestMethod.GET)
	public String c_reserveDeleteOK(CourtVO vo) {
		log.info("/c_reserveDeleteOK.do...{}", vo);

		int result = service.c_delete(vo);

		if (result == 1) {
			return "redirect:game_list.do?g_joiner=" + vo.getUser_id();
		} else {
			return "court_reserve/reserveDelete_failed";
		}
	}
}
