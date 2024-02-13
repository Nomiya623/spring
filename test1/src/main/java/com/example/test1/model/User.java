package com.example.test1.model;

//stu-no, stu_no 카멜 표기법으로 바꿔서 리턴
public class User {
	private String userid;
	private String pwd;
	private String username;
	private String phone;
	private String gender;
	private String hobby1;
	private String hobby2;
	private String hobby3;
	private String cmt;
	private String cnt;
	private String status;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHobby1() {
		return hobby1;
	}
	public void setHobby1(String hobby1) {
		this.hobby1 = hobby1;
	}
	public String getHobby2() {
		return hobby2;
	}
	public void setHobby2(String hobby2) {
		this.hobby2 = hobby2;
	}
	public String getHobby3() {
		return hobby3;
	}
	public void setHobby3(String hobby3) {
		this.hobby3 = hobby3;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
