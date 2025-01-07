package com.peachmarket.opticyellow.kakaopay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.kakaopay.model.KakaoPayApproveVO;
import com.peachmarket.opticyellow.kakaopay.model.KakaoPayDAO;
import com.peachmarket.opticyellow.kakaopay.model.KakaoPayReadyVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoPayService {

	@Autowired
	KakaoPayDAO dao;
	
	public KakaoPayService() {
		log.info("KakaoPayService...");
	}

	public int insertTid(KakaoPayReadyVO response) {
		return dao.insertTid(response);
	}

	public KakaoPayReadyVO selectTid() {
		return dao.selectTid();
	}

	public int updateSuccess(KakaoPayApproveVO response) {
		return dao.updateSuccess(response);
	}

	public int updateCash(KakaoPayApproveVO vo) {
		return dao.updateCash(vo);
	}

	public KakaoPayApproveVO selectSuccess() {
		return dao.selectSuccess();
	}

	public KakaoPayApproveVO selectCash(KakaoPayApproveVO vo) {
		return dao.selectCash(vo);
	}

	public List<KakaoPayApproveVO> cashList(KakaoPayApproveVO vo) {
		return dao.cashList(vo);
	}
	
}
