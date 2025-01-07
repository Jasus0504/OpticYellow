package com.peachmarket.opticyellow.court.model;

import lombok.Data;

@Data
public class CourtResVO {
	
	// 병엽님 코드
	private String fac_id;
	private String court_id;
	private String court_name;
	private int reserve_no;
	private String user_id;
	private String start_time;
	private String end_time;
	private String total_fee;
}
