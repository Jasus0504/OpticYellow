package com.peachmarket.opticyellow.kakaopay.model;

import lombok.Data;

@Data
public class KakaoPayApproveVO {

	private String tid; // 결제 고유 번호
	private String aid; // 요청 고유 번호
	private String cid; // 가맹점 코드
	private int amount_total; // 전체 결제 금액
	private int amount_point; // 사용한 포인트 금액
	private int quantity; // 상품 수량
	private String item_name; // 상품 이름, 최대 100자
	private String created_at; // 결제 준비 요청 시각
	private String approved_at; // 결제 승인 시각
	private String partner_order_id; // 가맹점 주문번호, 최대 100자
	private String partner_user_id; // 가맹점 회원 id, 최대 100자
	private String payment_method_type; // 결제 수단, CARD 또는 MONEY 중 하나
	
	private String m_id; // 로그인된 아이디
	private int cash; // 보유중인 캐시
}
