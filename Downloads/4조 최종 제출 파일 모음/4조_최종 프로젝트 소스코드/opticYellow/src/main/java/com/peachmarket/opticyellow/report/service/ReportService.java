package com.peachmarket.opticyellow.report.service;

import java.util.List;   

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.report.model.ReportDAO;
import com.peachmarket.opticyellow.report.model.ReportVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ReportService {

	@Autowired
	ReportDAO dao;
	public List<ReportVO> r_mylist(ReportVO vo){
		return dao.r_mylist(vo);
	}
	

	public int r_insert(ReportVO vo) {
		return dao.r_insert(vo);
	}


	public ReportVO r_selectOne(ReportVO vo) {

		return dao.r_selectOne(vo);
	}


	public List<ReportVO> r_selectAll(ReportVO vo) {
		return dao.r_selectAll(vo);
	}


	public int adv_r_insert(ReportVO vo) {
		return dao.adv_r_insert(vo);
		
	}


	public List<ReportVO> unread() {
		return dao.r_unread();
	}


	



	
	
	
	

}
