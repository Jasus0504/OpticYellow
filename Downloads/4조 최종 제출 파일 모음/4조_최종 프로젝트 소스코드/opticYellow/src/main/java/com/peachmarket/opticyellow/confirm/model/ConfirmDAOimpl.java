package com.peachmarket.opticyellow.confirm.model;

import java.util.List; 

import org.apache.ibatis.session.SqlSession; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
 

@Slf4j
@Repository
public class ConfirmDAOimpl implements ConfirmDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ConfirmVO> selectList_Seller(ConfirmVO vo) {
		log.info("ConfirmDAOimpl()...{}",vo);
		return sqlSession.selectList("C_SELECTLIST_SELLER",vo);
	}

	@Override
	public ConfirmVO C_SELECTLIST_SELLER_INFO(ConfirmVO vo) {
		log.info("ConfirmDAOimpl()...{}",vo);
		return sqlSession.selectOne("C_SELECTLIST_SELLER_INFO",vo);
	}

	@Override
	public List<ConfirmVO> selectList_Buyer(ConfirmVO vo) {
		log.info("ConfirmDAOimpl()...{}",vo);
		return sqlSession.selectList("C_SELECTLIST_BUYER",vo);
	}

	@Override
	public ConfirmVO C_SELECTLIST_BUYER_INFO(ConfirmVO vo) {
		log.info("ConfirmDAOimpl()...{}",vo);
		return sqlSession.selectOne("C_SELECTLIST_BUYER_INFO",vo);
	}

	@Override
	public int deal_done_Ok(ConfirmVO vo) {
		log.info("ConfirmDAOimpl()...{}",vo);
		return sqlSession.update("DEAL_DONE_OK",vo);
	}

	@Override
	public List<ConfirmVO> deal_done_check(ConfirmVO vo) {
		log.info("ConfirmDAOimpl()...{}",vo);
		return sqlSession.selectList("DEAL_DONE_CHECK",vo);
	}



	


	
}
