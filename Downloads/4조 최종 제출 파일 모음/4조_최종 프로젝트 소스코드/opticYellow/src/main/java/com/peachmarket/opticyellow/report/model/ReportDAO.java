package com.peachmarket.opticyellow.report.model;

import java.util.List;

public interface ReportDAO {

	int r_insert(ReportVO vo);

	List<ReportVO> r_mylist(ReportVO vo);

	ReportVO r_selectOne(ReportVO vo);

	List<ReportVO> r_selectAll(ReportVO vo);

	int adv_r_insert(ReportVO vo);

	List<ReportVO> r_unread();

	
	

}
