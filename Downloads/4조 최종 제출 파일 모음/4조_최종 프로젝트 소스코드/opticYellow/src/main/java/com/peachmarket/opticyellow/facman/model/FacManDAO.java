package com.peachmarket.opticyellow.facman.model;

import java.util.List;

import com.peachmarket.opticyellow.common.PaginationVO;

public interface FacManDAO {

	// 병엽님 코드
	List<FacManVO> selectAll(PaginationVO pagination);

	List<FacManVO> searchList(String searchKey, String searchWord);

	int delete(FacManVO vo);

	int confirm(FacManVO vo);

	FacManVO selectOne(FacManVO vo);

	int update(FacManVO vo);

	void court_id_insert(FacManVO vo);

	int facSelectAllCnt();

}
