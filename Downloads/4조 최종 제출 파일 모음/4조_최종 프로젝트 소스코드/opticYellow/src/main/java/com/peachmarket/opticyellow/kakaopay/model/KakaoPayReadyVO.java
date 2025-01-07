package com.peachmarket.opticyellow.kakaopay.model;

import lombok.Data;

@Data
public class KakaoPayReadyVO {

	private String m_id; // 로그인된 아이디
	private String tid; // 결제 고유 번호, 20자
	private String next_redirect_pc_url; // 요청한 클라이언트가 PC 웹일 경우
	
}
