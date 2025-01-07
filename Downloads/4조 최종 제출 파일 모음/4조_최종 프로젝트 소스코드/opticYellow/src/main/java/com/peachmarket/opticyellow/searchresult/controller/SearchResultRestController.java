package com.peachmarket.opticyellow.searchresult.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.searchresult.model.SearchResultVO;
import com.peachmarket.opticyellow.searchresult.service.SearchResultService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SearchResultRestController {

	@Autowired
	private SearchResultService service;
	
	// 병엽님 코드
	@ResponseBody
	@RequestMapping(value = "/json_searchResultSelectAll.do", method = RequestMethod.GET)
	public List<SearchResultVO> json_searchResultSelectAll() {
		log.info("/json_searchResultSelectAll.do");
		List<SearchResultVO> vos = service.selectAll();
		
		return vos;
	}
	
	@RequestMapping(value = "/json_searchResultSearchList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<SearchResultVO> json_searchResultSearchList(String searchWord) {
		log.info("/json_searchResultSearchList.do");
		log.info("searchWord : {}", searchWord);
		List<SearchResultVO> vos = service.searchList(searchWord);
		
		return vos;
	}
}
