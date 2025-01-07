package com.peachmarket.opticyellow.kakaopay.model;

import java.util.List;

public interface KakaoPayDAO {

	int insertTid(KakaoPayReadyVO response);

	KakaoPayReadyVO selectTid();

	int updateSuccess(KakaoPayApproveVO response);

	int updateCash(KakaoPayApproveVO vo);

	KakaoPayApproveVO selectSuccess();

	KakaoPayApproveVO selectCash(KakaoPayApproveVO vo);

	List<KakaoPayApproveVO> cashList(KakaoPayApproveVO vo);

}
