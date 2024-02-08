package com.example.test1.model;

import lombok.Data;//getters setters 자동으로 만들어준다

@Data
//stu-no, stu_no 카멜 표기법으로 바꿔서 리턴
public class Student {
	private String stuNo;
	private String stuName;
	private String stuDept;
	private String stuGrade;
	private String stuClass;
	private String stuGender;
	private String stuHeight;
	private String stuWeight;
}
