package com.peachmarket.opticyellow.bid.model;

import java.util.List; 

import org.apache.ibatis.session.SqlSession; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
 

@Slf4j
@Repository
public class BidDAOimpl implements BidDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int b_insert(BidVO vo) {
		log.info("BidDAOimpl()...{},vo");
		return sqlSession.insert("B_INSERT",vo);
	}

	@Override
	public List<BidVO> b_selectAll() {
		log.info("BidDAOimpl()...{}");
		return sqlSession.selectList("B_SELECTALL");
	}

	@Override
	public BidVO b_selectone_High(BidVO vo) {
		log.info("SelectHigh()....");
		return sqlSession.selectOne("B_SELECTONE_HIGH",vo);
	}

	@Override
	public List<BidVO> b_selectList_FinalHigh() {
		log.info("BidDAOimpl()...{}");
		return sqlSession.selectList("B_SELECTALL_FINALHIGH");
	}

	@Override
	public List<BidVO> b_sell_list(BidVO vo) {
		log.info("BidDAOimpl()...{}",vo);
		return sqlSession.selectList("B_SELL_LIST",vo);

	}
	@Override
	public List<BidVO> b_buy_list(BidVO vo) {
		log.info("BidDAOimpl()...{}",vo);
		return sqlSession.selectList("B_BUY_LIST",vo);

	}

	@Override
	public List<BidVO> b_bought_list(BidVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("B_BOUGHT_LIST",vo);
	}

	@Override
	public List<BidVO> b_sold_list(BidVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("B_SOLD_LIST",vo);
	}


	
}
