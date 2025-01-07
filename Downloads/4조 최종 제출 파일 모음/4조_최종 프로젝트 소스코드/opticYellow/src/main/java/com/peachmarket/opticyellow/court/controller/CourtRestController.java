package com.peachmarket.opticyellow.court.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.common.PaginationVO;
import com.peachmarket.opticyellow.court.model.CourtResVO;
import com.peachmarket.opticyellow.court.model.CourtVO;
import com.peachmarket.opticyellow.court.model.FacManwithCourtVO;
import com.peachmarket.opticyellow.court.service.CourtService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CourtRestController {

	@Autowired
	CourtService service;

	// 민서님 코드
	@RequestMapping(value = "/json_court_list.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CourtVO> json_court_list(CourtVO vo) {
		log.info("/json_court_list.do... {}", vo);

		List<CourtVO> vos = service.courtList(vo);
		log.info("{}", vos);

		return vos;
	}

	// 병엽님 코드
	@RequestMapping(value = "/json_courtSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public FacManwithCourtVO json_courtSelectOne(FacManwithCourtVO vo) {
		log.info("/json_courtSelectOne.do... {}",vo);

		FacManwithCourtVO vo2 = service.selectOne(vo);
		log.info("{}", vo2);

		return vo2;
	}

	@RequestMapping(value = "/json_courtSelectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FacManwithCourtVO> json_courtSelectAll(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_courtSelectAll.do...");
		
		int listCnt = service.courtAllCnt();
		// Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		List<FacManwithCourtVO> vos = service.selectAll(pagination);
		log.info("{}", vos);

		return vos;
	}

	@RequestMapping(value = "/json_courtSearchList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FacManwithCourtVO> json_facManSearchList(String region, String subRegion, String in_or_out,
			String floor_type) {
		log.info("/json_courtSearchList.do...{}, {}", region, subRegion);
		log.info("/json_courtSearchList.do...{}, {}", in_or_out, floor_type);

		List<FacManwithCourtVO> vos = service.searchList("%" + region + "%", "%" + subRegion + "%", in_or_out,
				floor_type);

		return vos;
	}
	
	@RequestMapping(value = "/json_courtRunning.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FacManwithCourtVO> json_courtRunning(FacManwithCourtVO vo) {
		log.info("/json_courtRunning.do...{}", vo);

		List<FacManwithCourtVO> vos = service.courtAll(vo);
		log.info("{}", vos);
		
		return vos;
	}
	
	@RequestMapping(value = "/json_courtReserveInfo.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CourtResVO> json_courtReserveInfo(String court_id, String start_date, String end_date) {
		log.info("/json_courtReserveInfo.do...{}, {}", court_id, start_date);
		log.info("/json_courtReserveInfo.do...{}", end_date);

		List<CourtResVO> vos = service.getinfo(court_id, "%"+start_date+"%", "%"+end_date+"%");
		log.info("vos : {}", vos);
		
		return vos;
		
	}
	
	@RequestMapping(value = "/json_reserveCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CourtResVO> json_reserveCheck(String court_id, String start_date, String end_date) {
		log.info("/json_reserveCheck.do...{}, {}", court_id, start_date);
		log.info("/json_reserveCheck.do...{}", end_date);

		List<CourtResVO> vos = service.getinfo(court_id, "%"+start_date+"%", "%"+end_date+"%");
		log.info("vos : {}", vos);
		
		return vos;
		
	}

}
