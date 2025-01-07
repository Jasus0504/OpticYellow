package com.peachmarket.opticyellow.product.model;
	
	import org.springframework.web.multipart.MultipartFile;   

	import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
	
	@Data
	public class ProductVO {
	
		private String m_id;
		private String cat;
		private int price;
		private int p_num;
		private int p_viewcount;
		private	String p_name;
		private	String p_info;
		private	String p_cond;
		private int low;
		private String buyer;
		private String seller;
		private String b_granted;
		private String s_granted;
		private String p_pic1;
		private String p_pic2;
		private String p_pic3;
		private MultipartFile multipartFile1;
		private MultipartFile multipartFile2;
		private MultipartFile multipartFile3;
		private String dead_line;
		private	String p_insert_time;
		private int start_price;
		private int high_price;
		private String deal_done;
		
	}

	
	
	