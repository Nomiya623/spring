package com.example.test1.model;

import lombok.Data;

@Data
public class Comment {
	private int commentNo;
	private int boardNo;
	private String cmt;
	private String userId;
	private String deleteYn;
	private int pCommentNo;
	private String cDateTime;
	private String uDateTime;
	
	private String userName;
	
	private boolean updateFlg = true;
}