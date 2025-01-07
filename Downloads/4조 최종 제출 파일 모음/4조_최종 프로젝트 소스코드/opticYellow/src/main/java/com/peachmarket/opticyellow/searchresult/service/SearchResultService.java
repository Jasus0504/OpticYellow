package com.peachmarket.opticyellow.searchresult.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.facman.model.FacManVO;
import com.peachmarket.opticyellow.searchresult.model.SearchResultDAO;
import com.peachmarket.opticyellow.searchresult.model.SearchResultVO;

@Service
public class SearchResultService {

	@Autowired
	SearchResultDAO dao;

	// 병엽님 코드
	public List<SearchResultVO> selectAll() {
		return dao.selectAll();
	}

	public List<SearchResultVO> searchList(String searchWord) {
		return dao.searchList(searchWord);
	}
}
