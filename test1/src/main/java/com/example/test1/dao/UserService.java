package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	HashMap<String, Object> searchUser(HashMap<String, Object> map); // 로그인
	void addUser(HashMap<String, Object> map); // 회원가입
	HashMap<String, Object> checkUser(HashMap<String, Object> map); // 중복체크
	// 회원정보 수정 페이지 회원 정보
	HashMap<String, Object> searchEditUser(HashMap<String, Object> map); 
}
