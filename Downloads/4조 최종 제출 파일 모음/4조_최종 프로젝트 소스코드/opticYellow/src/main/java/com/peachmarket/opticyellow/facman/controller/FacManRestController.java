package com.peachmarket.opticyellow.facman.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.common.PaginationVO;
import com.peachmarket.opticyellow.court.model.FacManwithCourtVO;
import com.peachmarket.opticyellow.facman.model.FacManVO;
import com.peachmarket.opticyellow.facman.service.FacManService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FacManRestController {

	@Autowired
	private FacManService service;

	// 병엽님 코드
	// 관리자용 테니스장 목록 비동기 호출
	@RequestMapping(value = "/json_facManSelectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FacManVO> json_facManSelectAll(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_courtSelectAll.do...");

		int listCnt = service.facSelectAllCnt();
		// Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		List<FacManVO> vos = service.selectAll(pagination);
		log.info("{}", vos);

		return vos;
	}

	// 비동기 검색
	@RequestMapping(value = "/json_facManSearchList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FacManVO> json_facManSearchList(String searchKey, String searchWord) {
		log.info("/json_facManSearchList.do");
		log.info("searchKey : {}", searchKey);
		log.info("searchWord : {}", searchWord);
		List<FacManVO> vos = service.searchList(searchKey, searchWord);

		return vos;
	}

	// 관리자용 테니스장 상세 정보 비동기 호출
	@RequestMapping(value = "/json_facManSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public FacManVO json_facManSelectOne(FacManVO vo) {
		log.info("/json_facManSelectOne.do...{}", vo);

		FacManVO vo2 = service.selectOne(vo);
		log.info("vo2 : {}", vo2);

		if (vo2.getFloor_type().equals("hard")) {
			vo2.setFloor_type("하드");
		} else if (vo2.getFloor_type().equals("clay")) {
			vo2.setFloor_type("클레이");
		} else if (vo2.getFloor_type().equals("grass")) {
			vo2.setFloor_type("잔디");
		}

		if (vo2.getIn_or_out().equals("indoor")) {
			vo2.setIn_or_out("실내");
		} else if (vo2.getIn_or_out().equals("outdoor")) {
			vo2.setIn_or_out("실외");
		}

		if (vo2.getCome() == null) {
			vo2.setCome("내용 없음");
		}

		if (vo2.getConv() == null) {
			vo2.setConv("내용 없음");
		}

		return vo2;
	}
}
