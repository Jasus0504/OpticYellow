package com.peachmarket.opticyellow.qnaanswer.model;


import java.util.Date;

import lombok.Data;

@Data
public class QnaAnswerVO {
	
	
	// 효림님 코드
	private int qa_num;
	private int q_num;
	private String qa_writer;
	private String qa_content;
	private Date qa_date;
	private String formatted_qa_date;
}
