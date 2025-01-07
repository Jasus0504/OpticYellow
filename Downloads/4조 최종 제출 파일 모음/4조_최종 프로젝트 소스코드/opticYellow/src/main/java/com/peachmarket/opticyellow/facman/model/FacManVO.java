package com.peachmarket.opticyellow.facman.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FacManVO {
	
	// 병엽님 코드
	private String fac_id;
	private String fac_name;
	private String floor_type;
	private int court_no;
	private String address;
	private String f_confirm;
	private String court_pic1;
	private String court_pic2;
	private String court_pic3;
	private String register_id;
	private String open_time;
	private String close_time;
	private String in_or_out;
	private String conv;
	private String come;
	private MultipartFile multipartFile1;
	private MultipartFile multipartFile2;
	private MultipartFile multipartFile3;
	private String regi_time;
	private int c_price;
}
