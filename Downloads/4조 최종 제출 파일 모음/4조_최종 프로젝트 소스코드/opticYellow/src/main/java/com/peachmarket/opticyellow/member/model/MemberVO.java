package com.peachmarket.opticyellow.member.model;

import org.springframework.web.multipart.MultipartFile;

import com.peachmarket.opticyellow.interceptor.Role;

import lombok.Data;

@Data
public class MemberVO {
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
}
