package com.example.test1.dao;

import java.util.HashMap;

public interface BoardService {
	// 게시글 목록
	HashMap<String, Object> searchBoardList(HashMap<String, Object> map);
	// 게시글 상세보기
	HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map);
	// 게시글 삭제
	HashMap<String, Object> removeBoard(HashMap<String, Object> map);
	// 게시글 작성
	HashMap<String, Object> addBoard(HashMap<String, Object> map);
	// 게시글 수정
	HashMap<String, Object> editBoard(HashMap<String, Object> map);
	// 댓글 등록
	HashMap<String, Object> addComment(HashMap<String, Object> map);
	
	HashMap<String, Object> editComment(HashMap<String, Object> map);
	
	HashMap<String, Object> searchUserDetail(HashMap<String, Object> map);
	
	HashMap<String, Object> addBoardFile(HashMap<String, Object> map);

}
