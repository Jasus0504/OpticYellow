package com.peachmarket.opticyellow.AirQuality.Model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.bid.model.BidDAOimpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AirQualityDAOimpl implements AirQualityDAO{

	@Autowired
	SqlSession sqlSession;
	
	public List<AirQualityVO> aq_selectAll() {


		return sqlSession.selectList("AQ_SELECTALL");
	}

	

}
