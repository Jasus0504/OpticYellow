package com.peachmarket.opticyellow.kakaopay.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class KakaoPayDAOimpl implements KakaoPayDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public KakaoPayDAOimpl() {
		log.info("KakaoPayDAOimpl...");
	}

	@Override
	public int insertTid(KakaoPayReadyVO response) {
		log.info("insertTid()...");
		
		return sqlSession.insert("INSERT_TID", response);
	}

	@Override
	public KakaoPayReadyVO selectTid() {
		log.info("selectTid()...");
		
		return sqlSession.selectOne("SELECT_TID");
	}

	@Override
	public int updateSuccess(KakaoPayApproveVO response) {
		log.info("updateSuccess()...");
		return sqlSession.update("UPDATE_SUCCESS", response);
	}

	@Override
	public int updateCash(KakaoPayApproveVO vo) {
		log.info("updateCash()...{}",vo);
		return sqlSession.update("UPDATE_CASH",vo);
	}

	@Override
	public KakaoPayApproveVO selectSuccess() {
		log.info("selectSuccess()...");
		return sqlSession.selectOne("SELECT_SUCCESS");
	}

	@Override
	public KakaoPayApproveVO selectCash(KakaoPayApproveVO vo) {
		log.info("selectCash()...");
		return sqlSession.selectOne("SELECT_CASH",vo);
	}

	@Override
	public List<KakaoPayApproveVO> cashList(KakaoPayApproveVO vo) {
		log.info("cashList()...");
		return sqlSession.selectList("CASH_LIST",vo);
	}
	
}
