package com.example.test1.model;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String title;
	private String contents;
	private int hit;
	private String userId;
	private String kind;
	private String cdatetime;
	private String udatetime;
	
	private String userName;
	private int commCnt;
}
