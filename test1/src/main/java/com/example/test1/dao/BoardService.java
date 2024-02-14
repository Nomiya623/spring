package com.example.test1.dao;

import java.util.HashMap;

public interface BoardService {
	HashMap<String, Object> searchBoardList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map);

	boolean deleteBoard(Long valueOf);
}
