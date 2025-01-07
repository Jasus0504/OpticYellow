package com.peachmarket.opticyellow.searchresult.model;

import java.util.List;

public interface SearchResultDAO {

	// 병엽님 코드
	List<SearchResultVO> selectAll();

	List<SearchResultVO> searchList(String searchWord);

}
