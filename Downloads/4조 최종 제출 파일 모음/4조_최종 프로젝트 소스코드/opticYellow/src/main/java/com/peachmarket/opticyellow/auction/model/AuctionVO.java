package com.peachmarket.opticyellow.auction.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class AuctionVO {

	private String seller;
	private int p_num;
	private String p_name;
	private String cat;
	private String p_pic1;
	private String p_pic2;
	private String p_pic3;
	private String p_info;
	private String p_cond;
	private Timestamp p_insert_time;
	private Date dead_line;
	private String b_granted;
	private int low;
	private int start_price;
	private int high_price;
	private String s_granted;
	private String deal_done;
	private String p_viewcount;
	
	private String granted_b;
	private Timestamp bid_time;
	private int price;
	private String buyer;
	private int b_num;
	
	private	String fp_insert_time;
	private String m_id;
	private String user_id;
	private String fdead_line;

}
