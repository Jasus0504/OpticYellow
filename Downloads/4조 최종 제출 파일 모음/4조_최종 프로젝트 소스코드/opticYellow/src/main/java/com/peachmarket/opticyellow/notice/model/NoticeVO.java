package com.peachmarket.opticyellow.notice.model;

import lombok.Data;

@Data
public class NoticeVO {

	// 효림님 코드
	private int n_num;
	private String n_title;
	private String n_content;
	private String n_writer;
	private String m_img;
	private String n_date;
	private int n_vcount;
	private String formatted_n_date;
}
