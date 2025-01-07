package com.peachmarket.opticyellow.court.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.common.PaginationVO;
import com.peachmarket.opticyellow.court.model.CourtDAO;
import com.peachmarket.opticyellow.court.model.CourtResVO;
import com.peachmarket.opticyellow.court.model.CourtVO;
import com.peachmarket.opticyellow.court.model.FacManwithCourtVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CourtService {

	@Autowired
	CourtDAO dao;

	// 민서님 코드
	public List<CourtVO> courtList(CourtVO vo) {
		return dao.courtList(vo);
	}

	// 병엽님 코드

	public FacManwithCourtVO selectOne(FacManwithCourtVO vo) {
	return dao.selectOne(vo);
	}

	public int courtAllCnt() {
		return dao.courtAllCnt();
	}

	public List<FacManwithCourtVO> selectAll(PaginationVO pagination) {
		return dao.selectAll(pagination);
	}

	public List<FacManwithCourtVO> searchList(String region, String subRegion, String in_or_out, String floor_type) {
		return dao.searchList(region, subRegion, in_or_out, floor_type);
	}

	public FacManwithCourtVO fac_selectOne(FacManwithCourtVO vo) {
		return dao.fac_selectOne(vo);
	}

	public List<FacManwithCourtVO> courtAll(FacManwithCourtVO vo) {
		return dao.courtAll(vo);
	}

	public List<CourtResVO> getinfo(String court_id, String start_date, String end_date) {
		return dao.getinfo(court_id, start_date, end_date);
	}

	public int c_reserve(CourtVO vo) {
		return dao.c_reserve(vo);
	}

	public int c_delete(CourtVO vo) {
		return dao.c_delete(vo);
	}
}
