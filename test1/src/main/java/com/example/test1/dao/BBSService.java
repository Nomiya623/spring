package com.example.test1.dao;

import java.util.HashMap;
// Service의 return 타입은 거의 무조건 HashMap이라고 생각하자
public interface BBSService {
	HashMap<String, Object> searchBBSList(HashMap<String, Object> map); // 게시판 목록
	HashMap<String, Object> addBBS(HashMap<String, Object> map); // 게시판 작성
	HashMap<String, Object> searchBBSInfo(HashMap<String, Object> map); // 게시판 상세 보기
	HashMap<String, Object> removeBBS(HashMap<String, Object> map); // 게시판 상세 보기
}