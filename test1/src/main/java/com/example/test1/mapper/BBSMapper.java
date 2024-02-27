package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.BBS;

@Mapper
public interface BBSMapper {
	List<BBS> selectBBSList(HashMap<String, Object> map); // 게시글 목록
	void insertBBS(HashMap<String, Object> map); // 게시글 작성
	BBS selectBBSInfo(HashMap<String, Object> map); // 게시글 상세 보기
	void updateHit(HashMap<String, Object> map); // 게시글 조회수 증가
	void deleteBBS(HashMap<String, Object> map); // 게시글 삭제
}
