package com.peachmarket.opticyellow.searchresult.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SearchResultController {

	// 병엽님 코드
	@RequestMapping(value = "/region_searchResult.do", method = RequestMethod.GET)
	public String region_searchResult() {
		log.info("region_searchResult...");

		return "fac_searchResult/region_searchResult";
	}

}
