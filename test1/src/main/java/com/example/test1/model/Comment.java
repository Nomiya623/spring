package com.example.test1.model;

import lombok.Data;

@Data
public class Comment {
	private int commentNo;
	private int boardNo;
	private String cmt;
	private String userId;
	private String deleteYn;
	private Integer pcommentNo;
	private String cdatetime;
	private String udatetime;
	
	private String userName;
	private boolean updateFlg = true;
}