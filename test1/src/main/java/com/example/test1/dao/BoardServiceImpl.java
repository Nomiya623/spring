package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;
import com.example.test1.model.BoardFile;
import com.example.test1.model.Comment;
import com.example.test1.model.User;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	
	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		/*
		 * map.put("sortColumn", "TITLE"); // Specify the column to sort by
		 * map.put("sortOrder", "ASC"); // Specify the sort order
		 */        
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String str = (String) map.get("str");
		List<Board> list = boardMapper.selectBoardList(map);
		int cnt = boardMapper.selectBoardListCnt(map);
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return resultMap;
	}


	@Override
	public HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardMapper.updateHit(map); // 조회수 증가
		Board board = boardMapper.selectBoardInfo(map); // 게시글 상세 조회
		List<BoardFile> fileList = boardMapper.boardFileList(map);
		
		List<Comment> commentList = boardMapper.selectCommentList(map); 
		
		resultMap.put("info", board);
		resultMap.put("fileList", fileList);
		resultMap.put("commentList", commentList);
		resultMap.put("result", "success");
		return resultMap ;
	}


	@Override
	public HashMap<String, Object> removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.deleteBoard(map);
			
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	@Override
	public HashMap<String, Object> addBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.insertBoard(map);
			/* boardMapper.insertBoardFile(map); */
			System.out.println(map.get("BOARDNO"));
			resultMap.put("boardNo", map.get("BOARDNO"));
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	@Override
	public HashMap<String, Object> editBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.updateBoard(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	@Override
	public HashMap<String, Object> addComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.insertComment(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	@Override
	public HashMap<String, Object> editComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.updateComment(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	@Override
	public HashMap<String, Object> searchUserDetail(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			User user = boardMapper.selectUserDetail(map);
			resultMap.put("result", "success");
			resultMap.put("user", user);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	@Override
	public HashMap<String, Object> addBoardFile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.insertBoardFile(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}


}
