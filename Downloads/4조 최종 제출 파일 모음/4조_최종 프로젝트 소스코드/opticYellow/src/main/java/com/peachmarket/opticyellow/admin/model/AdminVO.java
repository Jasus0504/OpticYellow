package com.peachmarket.opticyellow.admin.model;

import org.springframework.web.multipart.MultipartFile;

import com.peachmarket.opticyellow.interceptor.Role;

import lombok.Data;

@Data
public class AdminVO {
	// Member
	private String m_id;
	private String pw;
	private String name;
	private String gender;
	private String addr;
	private String tel;
	private String email;
	private String birth;
	private double m_ntrp;
	private String invite_code;
	private String introduce;
	private String m_img;
	private String m_location;
	private String m_time;
	private int cash;
	private String m_club;
	private String m_invite_code;
	private String role;
	private Role secured_role;
	private MultipartFile multipartFile;
	private int m_num;
	
	// Game
	private int g_num;
	private String g_joiner;
	private int g_resid;
	private String g_name;
	private int g_amount;
	private String g_open;
	private String court_name;
	private String fac_name;
	private String fac_id;
	
	// Reserve
	private int reserve_no;
	private String start_time;
	private String end_time;
	
}
