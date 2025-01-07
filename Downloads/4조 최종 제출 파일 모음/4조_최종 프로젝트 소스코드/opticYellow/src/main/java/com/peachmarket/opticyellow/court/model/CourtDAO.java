package com.peachmarket.opticyellow.court.model;

import java.util.List;

import com.peachmarket.opticyellow.common.PaginationVO;

public interface CourtDAO {

	// 민서님 코드
	List<CourtVO> courtList(CourtVO vo);

	// 병엽님 코드
	FacManwithCourtVO selectOne(FacManwithCourtVO vo);

	List<FacManwithCourtVO> selectAll(PaginationVO pagination);

	List<FacManwithCourtVO> searchList(String region, String subRegion, String in_or_out, String floor_type);

	int courtAllCnt();
	
	FacManwithCourtVO fac_selectOne(FacManwithCourtVO vo);

	List<FacManwithCourtVO> courtAll(FacManwithCourtVO vo);

	List<CourtResVO> getinfo(String court_id, String start_date, String end_date);
	
	int c_reserve(CourtVO vo);

	int c_delete(CourtVO vo);

}
