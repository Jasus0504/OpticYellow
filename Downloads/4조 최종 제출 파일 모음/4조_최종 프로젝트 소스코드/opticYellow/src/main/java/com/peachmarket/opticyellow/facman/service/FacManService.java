package com.peachmarket.opticyellow.facman.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.common.PaginationVO;
import com.peachmarket.opticyellow.facman.model.FacManDAO;
import com.peachmarket.opticyellow.facman.model.FacManVO;

@Service
public class FacManService {

	@Autowired
	FacManDAO dao;

	// 병엽님 코드
	public List<FacManVO> selectAll(PaginationVO pagination) {
		return dao.selectAll(pagination);
	}

	public List<FacManVO> searchList(String searchKey, String searchWord) {
		return dao.searchList(searchKey, searchWord);
	}

	public int delete(FacManVO vo) {
		return dao.delete(vo);
	}

	public int confirm(FacManVO vo) {
		return dao.confirm(vo);
	}

	public FacManVO selectOne(FacManVO vo) {
		return dao.selectOne(vo);
	}

	public int update(FacManVO vo) {
		return dao.update(vo);
	}

	public void court_id_insert(FacManVO vo) {
		dao.court_id_insert(vo);
	}

	public int facSelectAllCnt() {
		return dao.facSelectAllCnt();
	}

	


	
}
