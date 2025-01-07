package com.peachmarket.opticyellow.allcmt.model;

import lombok.Data;

@Data
public class AllCmtVO {

	private int cmt_num;
	private int comm_num;
	private String cmt_id;
	private String cmt_content;
	private String cmt_date;
	private int cmt_likes;
	private String formatted_cmt_date;
	private String m_img;
	
	// pagination
	private int startList;
	private int endList;
}
