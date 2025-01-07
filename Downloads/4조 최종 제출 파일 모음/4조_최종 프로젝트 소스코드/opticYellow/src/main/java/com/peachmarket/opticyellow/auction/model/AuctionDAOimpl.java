
package com.peachmarket.opticyellow.auction.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AuctionDAOimpl implements AuctionDAO {

	@Autowired
	SqlSession sqlSession;

	public AuctionDAOimpl() {
		log.info("AuctionDAOimpl()...");
	}

	@Override
	public List<AuctionVO> auctionBuyList(AuctionVO vo) {
		log.info("auctionBuyList()...{}", vo);

		return sqlSession.selectList("MYPAGE_BUY_LIST", vo);
	}

	@Override
	public List<AuctionVO> auctionSaleList(AuctionVO vo) {
		log.info("auctionSaleList()...{}", vo);

		return sqlSession.selectList("MYPAGE_SALE_LIST", vo);
	}

}
