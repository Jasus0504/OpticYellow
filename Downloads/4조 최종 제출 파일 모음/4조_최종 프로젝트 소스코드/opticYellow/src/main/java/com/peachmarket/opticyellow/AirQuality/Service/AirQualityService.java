package com.peachmarket.opticyellow.AirQuality.Service;

import java.util.List;    

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.AirQuality.Model.AirQualityDAO;
import com.peachmarket.opticyellow.AirQuality.Model.AirQualityVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class AirQualityService {

	@Autowired
	AirQualityDAO dao;

	public List<AirQualityVO> aq_selectAll( ) {
		return dao.aq_selectAll();
	}
	


}
