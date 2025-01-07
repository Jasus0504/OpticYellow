package com.peachmarket.opticyellow.qna.model;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	// 효림님 코드
	private int q_num;
	private String q_writer;
	private String m_img;
	private String q_content;
	private String q_title;
	private Date q_date;
	private String formatted_q_date;
}
