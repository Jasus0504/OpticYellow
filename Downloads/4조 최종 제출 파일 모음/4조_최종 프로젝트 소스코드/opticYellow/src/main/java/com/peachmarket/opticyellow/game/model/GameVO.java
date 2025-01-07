package com.peachmarket.opticyellow.game.model;

import lombok.Data;

@Data
public class GameVO {
	private int g_num;
	private String g_name;
	private int g_amount;
	private String g_start_dt;
	private String g_end_dt;
	private int g_bill;
	private String g_creater;
	private String c_id;
	private String fac_id;
	private String fac_name;
	private String g_info;
	private String g_method;
	private Double g_ntrp;
	private String g_open;
	private int g_remaining;
	private String g_address;
	
	// 민서님 join 변수
	private int g_resid;
	private String g_joiner;
}