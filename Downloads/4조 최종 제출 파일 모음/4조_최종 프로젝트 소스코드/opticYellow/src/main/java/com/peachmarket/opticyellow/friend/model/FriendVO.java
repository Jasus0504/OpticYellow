package com.peachmarket.opticyellow.friend.model;

import lombok.Data;

@Data
public class FriendVO {

	private String m_user_id;
	private int sns_num;
	private String to_user_id;
	private int are_we_friend_st;

	private int m_num;
	private String m_id;
	private String name;
	private String gender;
	private String birth;
	private double m_ntrp;

	private String introduce;
	private String m_location;
	private String m_time;
	private String m_img;

	private int g_resid;
	private String g_joiner;
	private int g_num;
	private String g_name;
	private int g_amount;
	private String g_start_dt;
	private String g_end_dt;
	private int g_bill;
	private String g_method;
	private float g_ntrp;
	private String g_info;
	private String fac_name;

}
