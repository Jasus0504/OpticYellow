package com.peachmarket.opticyellow.allcommu.model;

import lombok.Data;

@Data
public class AllCommuVO {

	private int comm_num;
	private String comm_id;
	private String comm_title;
	private String comm_content;
	private String comm_date;
	private int comm_vcount;
	private int comm_cmt;
	private int comm_likes;
	private String formatted_comm_date;
	private String m_img;
	
}
