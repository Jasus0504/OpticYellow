package com.peachmarket.opticyellow.report.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ReportDAOimpl implements ReportDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int r_insert(ReportVO vo) {
		log.info("ProductDAOimpl()...{}",vo);
		return sqlSession.insert("R_INSERT", vo);
	}

	@Override
	public List<ReportVO> r_mylist(ReportVO vo) {
		log.info("ProductDAOimpl()...{}",vo);
		return sqlSession.selectList("R_MYLIST",vo);
	}

	@Override
	public ReportVO r_selectOne(ReportVO vo) {
		log.info("ReportDAOimpl()...{}",vo);
		return sqlSession.selectOne("R_SELECTONE",vo);
	}

	@Override
	public List<ReportVO> r_selectAll(ReportVO vo) {
		log.info("ReportDAOimpl()...{}",vo);
		return sqlSession.selectList("R_SELECTALL",vo);
	}

	@Override
	public int adv_r_insert(ReportVO vo) {
		log.info("ReportDAOimpl()...{}",vo);
		return sqlSession.update("ADV_R_INSERT", vo);
	}

	@Override
	public List<ReportVO> r_unread() {
		return sqlSession.selectList("R_UNREAD");
	}

	

}
