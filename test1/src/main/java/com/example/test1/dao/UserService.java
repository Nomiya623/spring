package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	HashMap<String, Object> searchUser(HashMap<String, Object> map); // 로그인
	void addUser(HashMap<String, Object> map); // 회원가입
	HashMap<String, Object> checkUser(HashMap<String, Object> map); // 중복체크
	// 회원정보 수정 페이지 회원 정보
	HashMap<String, Object> searchEditUser(HashMap<String, Object> map);
	//인증코드 요청
	HashMap<String, Object> sendAuthCodeToPhoneNumber(String phoneNumber);
	//인증코드 검증
	boolean verifyAuthCode(String phoneNumber, String authCode);
	//비밀번호 재설정
	void resetPassword(String phoneNumber, String newPassword); 
}
