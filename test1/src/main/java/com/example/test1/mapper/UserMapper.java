package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.User;

@Mapper
public interface UserMapper {
	User selectUser(HashMap<String, Object> map); // 로그인
	void insertUser(HashMap<String, Object> map); // 회원가입
	// 핸드폰 번호를 통해 사용자 정보를 조회합니다.
	User selectUserByPhoneNumber(HashMap<String, Object> paramMap);
	// 사용자가 존재하면, 비밀번호를 업데이트합니다.
	void updatePassword(HashMap<String, Object> updateMap);
}
