package com.example.test1.dao;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	//↓ 어느 페이지를 가든 하나의 객체만을 가지고 사용하게끔
	@Autowired
	HttpSession session;
	
	@Override
	public HashMap<String, Object> searchUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		User user = userMapper.selectUser(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(user == null) {
			// 아이디가 없는 경우
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다.");
		} else {
			// 아이디가 있는 경우
			String pwd = (String)map.get("pwd");
			// 원래는 보안상의 이유로 db 접속(mybatis)해서 검색해야 돼서 .xml에서 쿼리문 한 번 더 사용해야 함
			if(user.getPwd().equals(pwd)) {
				// 로그인 성공
				resultMap.put("result", "success");
				resultMap.put("message", user.getUserName() + "님 환영합니다.");
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userStatus", user.getStatus());
			} else {
				// 패스워드가 다른 경우
				resultMap.put("result", "fail");
				resultMap.put("message", "비밀번호가 일치하지 않습니다.");
			}
		}
		
		return resultMap;
	}

	@Override
	public void addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.insertUser(map);
	}

	@Override
	public HashMap<String, Object> checkUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);
		if(user == null) {
			resultMap.put("message", "사용 가능한 아이디입니다!\n사용하시겠습니까?");
			resultMap.put("result", "success");
		} else {
			resultMap.put("message", "중복된 아이디입니다!");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchEditUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);
		resultMap.put("user", user);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> detailUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			User user = userMapper.selectUser(map);
			resultMap.put("user", user);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

}