package com.peachmarket.opticyellow.faq.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FAQVO {

	// 효림님 코드
	private int f_num;
	private String f_category;
	private String f_title;
	private String f_content;
	private String f_writer;
	private String m_img;
	private String f_date;
	private int f_vcount;
	private String formatted_faq_date;
}
